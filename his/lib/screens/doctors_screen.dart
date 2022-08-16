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
            return GestureDetector(onTap:()=>Navigator.push( context,MaterialPageRoute(builder: (context) => DoctorInfoScreen(Email: '',Phone: '0998876544' ,FullName: 'oooooo',Specified: 'kkkkkkk',))),
              child: Container(
                height: 200,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    color: CustomeColor.MainScreenButtomColorFirst),
                child: Row(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      CircularProgressIndicator(),
                      Container(width: 100,height:100,decoration: BoxDecoration(shape: BoxShape.circle,image:DecorationImage(image: NetworkImage(
                          'https://i.pinimg.com/564x/99/7c/98/997c98690995eb77cb65cb88f39856b0.jpg'),fit: BoxFit.fill)),
                  ),
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
