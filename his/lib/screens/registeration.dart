import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class Registeration extends StatefulWidget {
  Registeration({Key? key}) : super(key: key);

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  List<TextEditingController> controller =
      List.generate(5, (index) => TextEditingController());
  @override
  void dispose() {
    this.controller.forEach((element) {
      element.dispose();
    });
    print('Dispose used');
    super.dispose();
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
              padding: EdgeInsets.only(top: 50, bottom: 50),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Registeration', style: TextStyle(fontSize: 30)),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: controller[0],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter Your first name',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: controller[1],
                      decoration: InputDecoration(
                          hintText: 'Enter Your last name',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      controller: controller[2],
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter Your phone',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: controller[3],
                      decoration: InputDecoration(
                          hintText: 'Enter Your Address',
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: controller[4],
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          border: InputBorder.none),
                    ),
                  ),
                  CustomePaswwordEntry(),
                  ElevatedButton(onPressed: () => null, child: Text("Submit"))
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

class CustomePaswwordEntry extends StatefulWidget {
  CustomePaswwordEntry({Key? key}) : super(key: key);
  _CustomePaswwordEntryState state = _CustomePaswwordEntryState();
  @override
  State<CustomePaswwordEntry> createState() {
    String s = state.textEditingController.text;
    state = _CustomePaswwordEntryState();
    state.textEditingController.text = s;
    return state;
  }
}

class _CustomePaswwordEntryState extends State<CustomePaswwordEntry> {
  TextEditingController textEditingController = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();

  bool show = false;
  @override
  void dispose() {
     textEditingController.dispose();
     textEditingController2.dispose();
     super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         show
            ? Container(
                width: 500,
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: 'Enter Your PASSWORD',
                      border: InputBorder.none),
                ),
              )
            : Container(
                width: 500,
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: 'Enter Your PASSWORD',
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height:20),
        show
            ? Container(
                width: 500,
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: textEditingController2,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Confirmation PASSWORD',
                      border: InputBorder.none),
                ),
              )
            : Container(
                width: 500,
                padding: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: textEditingController2,
                  decoration: InputDecoration(
                      hintText: 'Enter Your PASSWORD Confirmation',
                      border: InputBorder.none),
                ),
              ),
       
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
                value: show,
                onChanged: (b) {
                  setState(() {
                    show = b is bool ? b : !show;
                  });
                }),
            Text("show password")
          ],
        )
      ],
    );
  }
}
