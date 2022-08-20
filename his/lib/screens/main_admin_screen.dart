import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'main_screen.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: AppBar(
            leading: null,
            title: Center(
                child: Text('HIS', style: TextStyle(color: Colors.black))),
            backgroundColor: CustomeColor.silver),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: CustomeButtom(
                  function: 'Patient',
                  color: CustomeColor.MainScreenButtomColorFirst,
                  text: Text('Patient',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/patient.png',
                    ),
                  ),
                  rightMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),
                Expanded(
                    child: CustomeButtom(
                  function: 'DoctorScreen',
                  color: CustomeColor.silver,
                  text: Text('Doctors',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                  image: Image(
                    image: AssetImage(
                      'assets/icons/man.png',
                    ),
                  ),
                  rightMargin: 8,
                  topMargin: 8,
                  buttonMargin: 20,
                  offset: Offset(2, 2),
                )),
              ],
            ),
          ),
          
        ],
      )),
    );;
  }
}