import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
    Image ImageLast;
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null || image == Null) {
        return;
      }
      if (kIsWeb) {
        ImageLast = Image.network(width: 500,height:500,image.path);
      } else {
        ImageLast = Image.file(File(image.path));
      }

      controller = Container( 
        child: ImageLast,
      );
      setState(() {
        print(controller);
      });
      //Image.file(File(image.path)));
    } on PlatformException {
      controller = Container(
        width: 500,
        height: 50,
        padding: EdgeInsets.only(left: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.grey),
        child: Center(
            child: Text('there is error in permission to upload the image',
                style: TextStyle(fontSize: 20))),
      );
      setState(() {});
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: CustomeColor.silver,
      ),
      body: Container(decoration: BoxDecoration(color:CustomeColor.MainScreenButtomColorFirst),
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
