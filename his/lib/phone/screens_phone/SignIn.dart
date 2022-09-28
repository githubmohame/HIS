import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'registeration.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(
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
            child: AppBar( leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              shadowColor: Colors.transparent,
              bottomOpacity: 0,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              title: Center(
                child: Text('HIS', style: TextStyle(fontSize: 30)),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      body:SignInPhone());
  }
}

class SignInPhone extends StatefulWidget {
  const SignInPhone({Key? key}) : super(key: key);

  @override
  State<SignInPhone> createState() => _SignInPhoneState();
}

class _SignInPhoneState extends State<SignInPhone> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> controller =
      List.generate(4, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return  Container(decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
          child: Center(
            child: Container(
               margin: EdgeInsets.only(left:20,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('SigInUp', style: TextStyle(fontSize: 30)),
                  Container(margin: EdgeInsets.only(bottom: 20),
                    width: 500,
                    padding: EdgeInsets.only(left: 10),
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
                          hintText: 'Enter Your Email',
                          border: InputBorder.none),
                    ),
                  ),
                  CustomePaswwordEntry(),
                  ElevatedButton(onPressed: () => null, child: Text("SignIn"))
                ],
              ),
            ),
          ),
    );
  }
}
