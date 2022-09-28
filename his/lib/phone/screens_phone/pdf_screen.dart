import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomeDocumentView extends StatelessWidget {
  CustomeDocumentView({Key? key, required this.url, required this.type})
      : super(key: key);
  Object url;
  int type;
  Widget returnRightWidget() {
    if (type == 1 && url is String) {
      return SfPdfViewer.network(url.toString());
    } else if (type == 2 && url is String) {
      return SfPdfViewer.file(File(url.toString()));
    }
    print(url.runtimeType);
    return url is Uint8List
        ? SfPdfViewer.memory((url as Uint8List))
        : Container();
  }

  @override
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
              child: Text('Document View', style: TextStyle(fontSize: 30)),
            ),
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: Colors.black)),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: returnRightWidget(),
    );
  }
}
