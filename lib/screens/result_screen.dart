import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:workerbase/providers/scan_provider.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {

  final String code;
  final Function() closeScreen;

   const ResultScreen({super.key, required this.closeScreen, required this.code});
  @override
  Widget build(BuildContext context) {
    final qrScannerProvider = Provider.of<QRScannerProvider>(context, listen: false);
    return Scaffold(
      appBar:AppBar(
        leading:IconButton(onPressed: (){
          qrScannerProvider.resetScan();
          Navigator.pop(context);
        },icon:const Icon(Icons.arrow_back),color:Colors.black54),
        title:const Text("QRScanner ",style:TextStyle(
            color:Colors.black87,
            fontSize:18,
            fontWeight:FontWeight.bold,
            letterSpacing:1),),
        centerTitle: true,
      ),
      body:Container(
        alignment: Alignment.center,
        padding:const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QrImageView(
            data: code,
            size: 160,
            version: QrVersions.auto,
          ),

          const Text("Scanned Result ",style:TextStyle(
            color:Colors.black87,
            fontSize:18,
            fontWeight:FontWeight.bold,
            letterSpacing:1),),
          const SizedBox(height: 10,),
          Text(code,
            textAlign:TextAlign.center,
            style:const TextStyle(
              color:Colors.black87,
              fontSize:18,
              fontWeight:FontWeight.bold,
              letterSpacing:1),),
        const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width-100,
            height:48,
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: (){
              Clipboard.setData(ClipboardData(text:code));
            },

              child:
            const Text("COPY ",style:TextStyle(
                color:Colors.white,
                fontSize:18,
                fontWeight:FontWeight.bold,
                letterSpacing:1),),
            ),
          ),],
      )),
    );
  }
}
