import 'package:flutter/material.dart';
import 'package:his/screens/registeration.dart';

import '../themes/colors.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> controller =
      List.generate(4, (index) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: GestureDetector(onTap: ()=>Navigator.pop(context),child: Icon(Icons.arrow_back,color:Colors.black)),backgroundColor: CustomeColor.silver,),
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
                  Text('SigInUp', style: TextStyle(fontSize: 30)),
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
          decoration: BoxDecoration(
              color: CustomeColor.MainScreenButtomColorFirst,
              shape: BoxShape.rectangle)),
    );
  }
}
