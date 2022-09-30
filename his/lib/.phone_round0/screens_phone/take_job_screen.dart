//import 'dart:io';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'pdf_screen.dart';

//import 'package:flutter/services.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class ApplyToJobScreen extends StatefulWidget {
  const ApplyToJobScreen({Key? key}) : super(key: key);

  @override
  State<ApplyToJobScreen> createState() => _ApplyToJobScreenState();
}

class _ApplyToJobScreenState extends State<ApplyToJobScreen> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:PreferredSize(
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
                child: Text('Apply Job', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: ApplyToJobPhone() ,
      ),
    );
  }
}

class CustomeDropDownButton extends StatefulWidget {
  CustomeDropDownButton(
      {required List<DropdownMenuItem<String>> list, Key? key})
      : state = CustomeDropDownButtonState(
            value: list[0].value.toString(), list: list),
        super(key: key);
  CustomeDropDownButtonState state;
  @override
  State<CustomeDropDownButton> createState() {
    return state =
        CustomeDropDownButtonState(value: state.value, list: state.list);
  }
}

class CustomeDropDownButtonState extends State<CustomeDropDownButton> {
  CustomeDropDownButtonState({
    required this.value,
    required this.list,
  });
  String value;
  List<DropdownMenuItem<String>> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: DropdownButton<String>(
          menuMaxHeight: 100,
          isExpanded: false,
          onTap: () => null,
          alignment: Alignment.center,
          borderRadius: BorderRadius.circular(20),
          underline: Container(),
          focusColor: Colors.white,
          dropdownColor: Colors.white,
          value: value,
          items: list,
          onChanged: (v) => setState(() {
                if (v is String) {
                  value = v;
                }
              })),
    );
  }
}
 class ApplyToJobPhone extends StatefulWidget {
   const ApplyToJobPhone({Key? key}) : super(key: key);
 
   @override
   State<ApplyToJobPhone> createState() => _ApplyToJobPhoneState();
 }
 
 class _ApplyToJobPhoneState extends State<ApplyToJobPhone> {
   TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  Future pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf' ],
      type: FileType.custom,
      allowMultiple: false,
    );
    if (result is FilePickerResult) {
      //Uint8List? pdf = result.files.first.bytes;
      if (kIsWeb) {
        Uint8List? pdf = result.files.first.bytes;
        if (pdf is Uint8List) {
          pathPdfFile = result;

        }
      } else {
        String? path = result.files.first.path;
        if (path is String) {
          pathPdfFile = path;
          
        }
      }
    }
  }
   Object pathPdfFile = 1;
  CustomeDropDownButton customeDropDownButton1 = CustomeDropDownButton(
    list: List<DropdownMenuItem<String>>.generate(
        10,
        (index) => DropdownMenuItem<String>(
              alignment: Alignment.center,
              child: Text(
                '${index.toString()}',
              ),
              value: index.toString(),
            )),
  );
   @override
   Widget build(BuildContext context) {
     return  Container( decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
          child: Column(children: [
            Container(decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextField(
                  controller: controller1,
                  style: TextStyle(),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Enter the email address',
                      border: InputBorder.none),
                )),
            SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: TextField(
                  controller: controller2,
                  style: TextStyle(),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Enter the phone number',
                      border: InputBorder.none),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Country', style: TextStyle(fontSize: 20)),
                Text('city', style: TextStyle(fontSize: 20)),
              ],
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),child: customeDropDownButton1),
                    // SizedBox(width:20),
                    Container(decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),child: customeDropDownButton1),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Text('Country', style: TextStyle(fontSize: 20)),
                Text('Country', style: TextStyle(fontSize: 20)),
                Text('city', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height:20),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Container(height:50 ,decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),child: TextField(decoration: InputDecoration(border: InputBorder.none),enabled: true,),),
                    Container(height:50, decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),child: TextField(decoration: InputDecoration(border: InputBorder.none),enabled: true,),),
                    Container(decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),height:50,width:300,child: TextField(enabled: true,decoration: InputDecoration(border: InputBorder.none),),)
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  pickPdf();
                },
                child: Text('choose pdf to upload')),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  pickPdf();
                },
                child: Text('uploading info')),
            ElevatedButton(
                onPressed: () {
                  if (pathPdfFile is String &&
                      pathPdfFile.toString().contains("http")) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CustomeDocumentView(type: 1, url: pathPdfFile),
                        ));
                  } else if (pathPdfFile is String) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CustomeDocumentView(type: 2, url: pathPdfFile),
                        ));
                  } else if (pathPdfFile is FilePickerResult) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomeDocumentView(
                              type: 3,
                              url: (pathPdfFile as FilePickerResult)
                                  .files
                                  .first
                                  .bytes!),
                        ));
                  }
                },
                child: Text('show info')),
          ]),
        );
   }
 }
 