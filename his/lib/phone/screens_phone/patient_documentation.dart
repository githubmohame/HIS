//import 'dart:html' as html;

import 'dart:io';

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
  TextEditingController textEditingController = TextEditingController();
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
                child:
                    Text('Patient Documents', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
            child: LayoutBuilder(builder: (context, constraint) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: textEditingController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter the FullName',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none),
                    ),
                  ),
                  Container( height: constraint.maxHeight - 110,
                    child: ListView.separated(
                      itemCount: 100,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageViewr(
                                url:
                                    'https://image.shutterstock.com/image-photo/business-woman-drawing-global-structure-600w-1006041130.jpg',
                              ),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white, width: 2),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1616012480717-fd9867059ca0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80'),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(child: Text('info of images'))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
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
              child: Text('Take Time', style: TextStyle(fontSize: 30)),
            ),
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: Colors.black)),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SfPdfViewer.network(
        this.url
        //'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        ,
        key: _pdfViewerKey,
      ),
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
                child: Text('Take Time', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: PhotoView(
          imageProvider: NetworkImage(url),
        ));
  }
}
