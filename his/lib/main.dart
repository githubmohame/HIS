import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:his/phone_round1/home_appointment.dart';

import 'phone_round1/main_screen.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: RouteScreen()));
}