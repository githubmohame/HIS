import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:his/phone_round1/choose_specialist.dart';
import 'package:his/phone_round1/doctors_screen.dart';
import 'package:his/phone_round1/flip_card.dart';
import 'package:his/phone_round1/home_appointment.dart';
import 'package:his/phone_round1/loading_screen.dart';

import 'phone_round1/main_screen.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false ,home:  DoctorsScreen ()));
}