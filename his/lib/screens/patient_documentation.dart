//import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PatientDocumentsView extends StatefulWidget {
  const PatientDocumentsView({Key? key}) : super(key: key);

  @override
  State<PatientDocumentsView> createState() => _PatientDocumentsViewState();
}

class _PatientDocumentsViewState extends State<PatientDocumentsView> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return SizedBox(
              height: 20,
            );
          }
          return Container(decoration: BoxDecoration(border:Border.all(color: Colors.grey,width:2) ,borderRadius: BorderRadius.all(Radius.circular(20))),
            child: GestureDetector(
                child: Row(
                  children: [
                    Container(height:60,width:60,
                      child: Image(
                        image: NetworkImage('https://images.unsplash.com/photo-1616012480717-fd9867059ca0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80'),
                      ),
                    ),
                    Expanded(child: Text('info of images'))
                  ],
                ),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaitentDocumentation(
                            url:
                                'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',),
                      ),
                    )),
          );
        },
      ),
    ));
  }
}

/// Represents Homepage for Navigation
class PaitentDocumentation extends StatefulWidget {
  PaitentDocumentation({required String url})
      : state = _PatientDocumentsState(url: url);
  _PatientDocumentsState state;
  @override
  _PatientDocumentsState createState() {
    return state = _PatientDocumentsState(url: state.url);
  }
}
class _PatientDocumentsState extends State<PaitentDocumentation> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  String url;
  @override
  void dispose() {

     super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }

  _PatientDocumentsState({required String url}) : url = url {}
  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(this.url
      //'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
      ,
      key: _pdfViewerKey,
    );
  }
}

class ImageViewr extends StatelessWidget {
  ImageViewr({required String url, Key? key})
      : url = url,
        super(key: key);
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PhotoView(
          imageProvider: NetworkImage(url),
        ));
  }
}
