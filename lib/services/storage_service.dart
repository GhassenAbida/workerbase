import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:workerbase/models/scan_history.dart'; // Replace with your QRScan model path

class DatabaseHelper {
  static const String _databaseName = "qr_scanner.db";
  static const int _databaseVersion = 1;
  static const String tableScans = 'scans';
  static const String columnId = 'id';
  static const String columnContent = 'content';
  static const String columnTimestamp = 'timestamp';

  // Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // Create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableScans (
            $columnId INTEGER PRIMARY KEY,
            $columnContent TEXT NOT NULL,
            $columnTimestamp TEXT NOT NULL
          )
          ''');
  }

  // Insert a new scan
  Future<int> insertScan(QRScan scan) async {
    Database db = await database;
    return await db.insert(tableScans, scan.toJson());
  }

  // Retrieve all scans in descending order by timestamp
  Future<List<QRScan>> getScans() async {
    Database db = await database;
    List<Map> maps = await db.query(tableScans, orderBy: '$columnTimestamp DESC');
    return List.generate(maps.length, (i) {
      return QRScan.fromJson(Map<String, dynamic>.from(maps[i]));
    });
  }

  // Retrieve paginated scans in descending order by timestamp
  Future<List<QRScan>> getPaginatedScans(int offset, int limit) async {
    Database db = await database;
    List<Map> maps = await db.query(
      tableScans,
      limit: limit,
      offset: offset,
      orderBy: '$columnTimestamp DESC',
    );
    return maps.map((map) => QRScan.fromJson(map as Map<String, dynamic>)).toList();
  }

  // Delete all scans
  Future<void> deleteAllScans() async {
    Database db = await database;
    await db.delete(tableScans);
  }
  Future<void> deleteScanByTimestamp(DateTime timestamp) async {
    Database db = await database;
    await db.delete(
      tableScans,
      where: '$columnTimestamp = ?', // Use the column name for timestamp
      whereArgs: [timestamp.toIso8601String()], // Ensure the format matches what's stored in the database
    );
  }
}
