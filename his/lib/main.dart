

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:his/phone/screens_phone/SignIn.dart';
import 'package:his/phone/screens_phone/appointment.dart';
import 'package:his/phone/screens_phone/doctors_screen.dart';
import 'package:his/phone/screens_phone/introduction_animation.dart';
import 'package:his/phone/screens_phone/main_admin_screen.dart';
import 'package:his/phone/screens_phone/main_screen.dart';
import 'package:his/phone/screens_phone/patient_documentation.dart';
import 'package:his/phone/screens_phone/patients_screen.dart';
import 'package:his/phone/screens_phone/registeration.dart';
import 'package:his/phone/screens_phone/take_job_screen.dart';
import 'package:his/phone/screens_phone/upload_medical_image.dart';

void main() {
   
    runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/IntroductionScreen',
    routes: <String, Widget Function(BuildContext)>{
      "/": (c) => MainScreen(),
      'Registration': (p0) => Registeration(),
      'Patient': (p0) => PatientScreen(),
      'DoctorScreen': (p0) => DoctorScreen(),
      "SignIn": (p0) => SignIn(),
      "UploadImageMedical": (p0) => UploadImageMedical(),
      "InpatientScreen": (p0) => AppointmentScreen(),
      "AdminMainScreen": (p0) => AdminMainScreen(),
      "PatientDocumentsView":(p0)=>PatientDocumentsView(),
      "ApplyToJobScreen":(p0) => ApplyToJobScreen(),
      "/IntroductionScreen":(p0) => IntroductionScreen(),
    },
  ));  
  //runApp(MaterialApp(debugShowCheckedModeBanner: false,home:DoctorScreen( )));
  //runApp(MaterialApp(home: TakeRegister(),) );
}

 /*


import 'package:flutter/material.dart';
 
main() {
  runApp(const MaterialApp(
    home: Homepage(),
  ));
}
 
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        child: const Text('Go to Page 2'),
      )
 
          // RaisedButton is deprecated
          // We should use ElevatedButton instead
 
          // child: RaisedButton(
          // child: const Text('Go to Page 2'),
          // onPressed: () {
          //     Navigator.of(context).push(_createRoute());
          // },
          // ),
 
          ),
    );
  }
}
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var end =  Offset.zero;
      var begin = Offset(1.0, 1.0);
      
      var curve = Curves.ease;
 
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
 
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
 
class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}*/