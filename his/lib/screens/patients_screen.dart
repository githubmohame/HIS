//import 'dart:html';

import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'patient_info_screen.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({Key? key}) : super(key: key);

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: CustomeColor.silver,
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return GestureDetector(onTap:()=>Navigator.push( context,MaterialPageRoute(builder: (context) =>  PatientInfoScreen(Phone: '0998876544',Adress: 'looo',FullName: 'oooooo',))),
              child: Container(
                width:double.infinity,
                height: 150,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width:1),
                    color: CustomeColor.MainScreenButtomColorFirst),
                child: Row(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      Container(width:10,height:10,child: CircularProgressIndicator(  )),
                      Container(width: 300,height:300,decoration: BoxDecoration(shape: BoxShape.circle,image:DecorationImage(image: NetworkImage(
                          'https://i.pinimg.com/564x/99/7c/98/997c98690995eb77cb65cb88f39856b0.jpg'),fit: BoxFit.fill)),
                  ),
                    ]),
                    Expanded(
                      child: Text(maxLines: 5,
                          'Name:Mihamed Ahmed Ali Soliman',
                          style:
                              TextStyle(overflow: TextOverflow.ellipsis, fontSize: 20)),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
