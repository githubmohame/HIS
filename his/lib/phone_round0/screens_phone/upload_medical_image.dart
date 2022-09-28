import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../themes/colors.dart';

class UploadImageMedical extends StatefulWidget {
  const UploadImageMedical({Key? key}) : super(key: key);
  @override
  State<UploadImageMedical> createState() => _UploadImageMedicalState();
}

class _UploadImageMedicalState extends State<UploadImageMedical> {
  File? image;
  Widget controller = Container();
  @override
  Future pickImage() async {
    Widget ImageLast;
    try {
      FilePickerResult? image = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ["pdf","jpg","png"]);
      if (image == null || image == Null) {
        return;
      }
      if(image is FilePickerResult&&(image.files.first.extension=='jpg'||image.files.first.extension=='png')){
         
      if (kIsWeb) {
        print("kill me");
        ImageLast = Image.memory(image.files.first.bytes!,width: 500,height:500 );
      } else {
        ImageLast = Image.file(File(image.files.first.path.toString()));
      }
      controller = Expanded(
        child: Container(width: double.infinity,
          child: ImageLast,
        ),
      );
      }
       if(image is FilePickerResult&&image.files.first.extension=='pdf') {
      if (kIsWeb) {
        ImageLast = SfPdfViewer.memory( image.files.first.bytes!);
      } else {
        ImageLast = SfPdfViewer.file(File(image.files.first.path.toString()));
      }
      controller = Expanded(
        child: Container(width: double.infinity,
          child: ImageLast,
        ),
      );
       }
      setState(() {
        print(controller);
      });
      //Image.file(File(image.path)));
    } on PlatformException {
      controller = Container(
        /*width: 500,
        height: 50,
        padding: EdgeInsets.only(left: 50),*/
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.grey),
        child: Center(
            child: Text('there is error in permission to upload the image',
                style: TextStyle(fontSize: 20))),
      );
      setState(() {});
    }
  }
  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
            child: AppBar(
              shadowColor: Colors.transparent,
              bottomOpacity: 0,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              title: Center(
                child: Text('Upload Image', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      body: Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller,
              ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text('choose Images to upload')),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: ()=>null, child: Text('UploadImageMedical'))
            ],
          ),
        ),
      ),
    );
  }
}
