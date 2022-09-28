import 'package:flutter/material.dart';

import 'package:his/models/main_user_model.dart';

import '../themes/colors.dart';

class DoctorInfoScreen extends StatelessWidget {
  String fullName;
  String email;
  String phone;
  String specified;
  String url;
  List<TextEditingController> textEditingController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  DoctorInfoScreen(
      {required this.url,
      required this.email,
      required this.fullName,
      required this.phone,
      required this.specified}) {
    textEditingController[0].text = email;
    textEditingController[1].text = fullName;
    textEditingController[2].text = phone;
    textEditingController[3].text = specified;
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
                child: Text('Doctors info', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: DoctorInfoPhone(url: url,
          email: email,
          fullName: fullName,
          phone: phone,
          specified: specified,
        ));
  }
}

class DoctorInfoPhone extends StatefulWidget {
  String fullName;
  String email;
  String phone;
  String specified;
  String url;
  List<TextEditingController> textEditingController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  DoctorInfoPhone({required this.url,
    Key? key,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.specified,
  }) : super(key: key) {
    print(MainUserModel.admin);
    textEditingController[0].text = email;
    textEditingController[1].text = fullName;
    textEditingController[2].text = phone;
    textEditingController[3].text = specified;
  }
  @override
  State<DoctorInfoPhone> createState() => _DoctorInfoPhoneState();
}

class _DoctorInfoPhoneState extends State<DoctorInfoPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
            Color.fromARGB(255, 128, 187, 236),
            Color.fromARGB(255, 249, 246, 246)
          ])),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(top: 0, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Container(height: 100,width:100,child:Image(height: 100,width:100,image:NetworkImage(widget.url)),)
              ,
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              Center(child: Text('Email', style: TextStyle(fontSize: 30))),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  enabled: MainUserModel.admin,
                  textAlign: TextAlign.center,
                  controller: widget.textEditingController[0],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the FullName', border: InputBorder.none),
                ),
              ),
              Center(child: Text('FullName', style: TextStyle(fontSize: 30))),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  enabled: MainUserModel.admin,
                  textAlign: TextAlign.center,
                  controller: widget.textEditingController[1],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the Adress', border: InputBorder.none),
                ),
              ),
              Center(child: Text('Phone', style: TextStyle(fontSize: 30))),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  enabled: MainUserModel.admin,
                  textAlign: TextAlign.center,
                  controller: widget.textEditingController[2],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the phone', border: InputBorder.none),
                ),
              ),
              Center(
                  child: Text('Specification', style: TextStyle(fontSize: 30))),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  enabled: MainUserModel.admin,
                  textAlign: TextAlign.center,
                  controller: widget.textEditingController[3],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the phone', border: InputBorder.none),
                ),
              ),
              MainUserModel.admin
                  ? Expanded(
                      child: Row(children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text('Update'),
                        onPressed: () => null,
                      )),
                      SizedBox(width: 20),
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.red)),
                        child: Text(
                            style: TextStyle(backgroundColor: Colors.red),
                            'delete'),
                        onPressed: () => null,
                      ))
                    ]))
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
