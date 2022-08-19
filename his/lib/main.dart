import 'package:flutter/material.dart';
import 'package:his/screens/main_screen.dart';
import 'package:his/screens/patients_screen.dart';
import 'package:his/screens/registeration.dart';
import 'package:his/screens/upload_medical_image.dart';

import 'screens/SignIn.dart';
import 'screens/doctors_screen.dart';
import 'screens/inpatient_screen.dart';
import 'screens/patient_info_screen.dart';

void main() {
   runApp(MaterialApp(debugShowCheckedModeBanner: false  ,
 initialRoute: '/',
    routes:<String, Widget Function(BuildContext)>{"/":(c)=>MainScreen(),'Registration':(p0) => Registeration(),
    'Patient':(p0) => PatientScreen()
    ,'DoctorScreen':(p0) => DoctorScreen(),"SignIn":(p0) => SignIn(),"UploadImageMedical":(p0) => UploadImageMedical(),"InpatientScreen":(p0) => Inpatient()   } ,)) ; 
  //runApp(MaterialApp(home: Inpatient()));
}
