//import 'dart:io';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//import 'package:flutter/services.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class ApplyToJobScreen extends StatefulWidget {
  const ApplyToJobScreen({Key? key}) : super(key: key);

  @override
  State<ApplyToJobScreen> createState() => _ApplyToJobScreenState();
}

class _ApplyToJobScreenState extends State<ApplyToJobScreen> {
  Widget controller = Container();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  Future pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf'],
      type: FileType.custom,
      allowMultiple: false,
    );
    if (result is FilePickerResult) {
      //Uint8List? pdf = result.files.first.bytes;
      if (kIsWeb) {
        Uint8List? pdf = result.files.first.bytes;
        if (pdf is Uint8List) {
          controller=Expanded(child: SfPdfViewer.memory(pdf), key: _pdfViewerKey);
          setState(() {});
        }
        
      }
      else{
          String? path = result.files.first.path;
          if (path is String) {
            controller =
                Expanded(child: SfPdfViewer.file(File(path)), key: _pdfViewerKey);
          }
          setState(() {
            print('lll');
          });
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(controller.runtimeType);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.grey,width:2)),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                )),
            controller,
            ElevatedButton(
                onPressed: () {
                  pickPdf();
                },
                child: Text('choose pdf to upload')),
          ]),
        ),
      ),
    );
  }
}
