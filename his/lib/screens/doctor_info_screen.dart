import 'package:flutter/material.dart';
import 'package:his/models/main_user_model.dart';

import '../themes/colors.dart';

class DoctorInfoScreen extends StatelessWidget {
  String FullName;
  String Email;
  String Phone;
  String Specified;
  List<TextEditingController> textEditingController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  DoctorInfoScreen(
      {required this.Email,
      required this.FullName,
      required this.Phone,
      required this.Specified}) {
    textEditingController[0].text = Email;
    textEditingController[1].text = FullName;
    textEditingController[2].text = Phone;
    textEditingController[3].text = Specified;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: CustomeColor.silver,
      ),
      body: Container(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 0, bottom: 50),
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                  border: Border.all(width: 5, color: Colors.black)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/564x/99/7c/98/997c98690995eb77cb65cb88f39856b0.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Center(
                      child: Text('Email', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(enabled:  MainUserModel.admin,
                      textAlign: TextAlign.center,
                      controller: textEditingController[0],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter the FullName',
                          border: InputBorder.none),
                    ),
                  ),
                  Center(
                      child: Text('FullName', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(enabled:  MainUserModel.admin,
                      textAlign: TextAlign.center,
                      controller: textEditingController[1],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter the Adress',
                          border: InputBorder.none),
                    ),
                  ),
                  Center(child: Text('Phone', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(enabled:  MainUserModel.admin,
                      textAlign: TextAlign.center,
                      controller: textEditingController[2],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter the phone',
                          border: InputBorder.none),
                    ),
                  ),
                  Center(child: Text('Specification', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(enabled:  MainUserModel.admin,
                      textAlign: TextAlign.center,
                      controller: textEditingController[3],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter the phone',
                          border: InputBorder.none),
                    ),
                  ),
                 MainUserModel.admin?Expanded(
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
                  ])):Container()
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: CustomeColor.MainScreenButtomColorFirst,
              shape: BoxShape.rectangle)),
    );
  }
}
