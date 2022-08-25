import 'package:flutter/material.dart';
import 'package:his/screens/doctor_info_screen.dart';

import '../themes/colors.dart';
import 'patient_info_screen.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
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
            return GestureDetector(onTap:()=>Navigator.push( context,MaterialPageRoute(builder: (context) => DoctorInfoScreen(Email: 'mohamed@gmail.com',Phone: '0998876544' ,FullName: 'oooooo',Specified: 'kkkkkkk',))),
              child: Container(
                height: 100,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width:0),
                    color: CustomeColor.MainScreenButtomColorFirst),
                child: Row(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      CircularProgressIndicator(),
                      Image.network('https://www.norman-network.net/sites/default/files/images/122715793%20network.jpg')
                      ,
                    ]),
                    Expanded(
                      child: Text(maxLines: 5,
                          'Name:Mihamed Ahmed Ali Soliman\nspecification at ................',
                          style:
                              TextStyle(overflow: TextOverflow.ellipsis, fontSize: 30)),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
