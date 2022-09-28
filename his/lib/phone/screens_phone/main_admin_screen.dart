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
      appBar:PreferredSize(
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
            child: AppBar(title:Center(child: Text('data')),
              shadowColor: Colors.transparent,
              bottomOpacity: 0,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      body: Row(
        children: [ 
          Expanded(
              child: CustomeButtom(
            function: 'DoctorScreen',
            color:  CustomeColor.silver,
            text: Text('Doctors',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
            image: Image(
              image: AssetImage(
                'assets/asset_phone/icons/man.png',
              ),
            ),
            rightMargin: 8,
            buttonMargin: 20,
            offset: Offset(2, 2),
          )),
          Expanded(
              child: CustomeButtom(
            function: 'Patient',
            color:  CustomeColor.silver,
            text: Text('Patient',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
            image: Image(
              image: AssetImage(
                'assets/asset_phone/icons/patient.png',
              ),
            ),
            rightMargin: 8,
            buttonMargin: 20,
            offset: Offset(2, 2),
          )),
          
        ],
      ),
    );;
  }
}