import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class Registeration extends StatefulWidget {
  Registeration({Key? key}) : super(key: key);

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
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
              child: Text('Registeration', style: TextStyle(fontSize: 30)),
            ),
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: Colors.black)),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        " 702.0	365.0";
        print(constraint.maxHeight.toString() +
            "\t" +
            constraint.maxWidth.toString());
            if(constraint.maxHeight<=720){
              return RegisterationPhone();
            }
        return RegisterationPhone();
      }),
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
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
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
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
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
        Text('data'),
        show
            ? Container(
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: textEditingController2,
                  decoration: InputDecoration(
                      hintText: 'Enter Your PASSWORD Confirmation',
                      border: InputBorder.none),
                ),
              )
            : Container(
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
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
        Text('data'),
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

class RegisterationPhone extends StatefulWidget {
  const RegisterationPhone({Key? key}) : super(key: key);

  @override
  State<RegisterationPhone> createState() => _RegisterationPhoneState();
}

class _RegisterationPhoneState extends State<RegisterationPhone> {
  List<TextEditingController> controller =
      List.generate(5, (index) => TextEditingController());
  void dispose() {
    this.controller.forEach((element) {
      element.dispose();
    });
    print('Dispose used');
    super.dispose();
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: controller[0],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter Your first name',
                      border: InputBorder.none),
                ),
              ),
              Text("go to hell",
                  style: TextStyle(color: Colors.red, fontSize: 15)),
              Container(
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: controller[1],
                  decoration: InputDecoration(
                      hintText: 'Enter Your last name',
                      border: InputBorder.none),
                ),
              ),
              Text("go to hell",
                  style: TextStyle(color: Colors.red, fontSize: 15)),
              Container(
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  controller: controller[2],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter Your phone', border: InputBorder.none),
                ),
              ),
              Text("go to hell",
                  style: TextStyle(color: Colors.red, fontSize: 15)),
              Container(
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: controller[3],
                  decoration: InputDecoration(
                      hintText: 'Enter Your Address', border: InputBorder.none),
                ),
              ),
              Text("go to hell",
                  style: TextStyle(color: Colors.red, fontSize: 15)),
              Container(
                padding: EdgeInsets.only(left: 50),
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: controller[4],
                  decoration: InputDecoration(
                      hintText: 'Enter Your Email', border: InputBorder.none),
                ),
              ),
              Text("go to hell",
                  style: TextStyle(color: Colors.red, fontSize: 15)),
              CustomePaswwordEntry(),
              ElevatedButton(onPressed: () => null, child: Text("Submit")),
            ],
          ),
        ),
      ),
      /*decoration: BoxDecoration(
              color: CustomeColor.MainScreenButtomColorFirst,
              shape: BoxShape.rectangle)*/
    );
  }
}

