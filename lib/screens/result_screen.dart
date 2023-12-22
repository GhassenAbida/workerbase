import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:workerbase/providers/scan_provider.dart';
import 'package:provider/provider.dart';
import 'package:workerbase/utils/colors.dart';

import 'package:fluttertoast/fluttertoast.dart';



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
        },icon:const Icon(Icons.arrow_back),color:lightBlackColor),
        title:const Text("QRScanner ",style:TextStyle(
            color:blackColor,
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
            color:blackColor,
            fontSize:18,
            fontWeight:FontWeight.bold,
            letterSpacing:1),),
          const SizedBox(height: 10,),
          Text(code,
            textAlign:TextAlign.center,
            style:const TextStyle(
              color:blackColor,
              fontSize:18,
              fontWeight:FontWeight.bold,
              letterSpacing:1),),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width - 100,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: code));
              // Show a toast message
              Fluttertoast.showToast(
                  msg: "Copied to Clipboard",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,  // Change this if you want the toast to appear elsewhere
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[800],  // Change this for different toast background color
                  textColor: Colors.white,  // Change this for different text color
                  fontSize: 16.0
              );
            },
            child: const Text(
              "COPY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],),),
    );
  }
}
