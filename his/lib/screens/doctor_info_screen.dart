import 'package:flutter/material.dart';

import '../themes/colors.dart';

class DoctorInfoScreen extends StatelessWidget {
  String FullName;
  String Email;
  String Phone;
  String Specified;
  DoctorInfoScreen(
      {required this.Email,required this.FullName, required this.Phone, required this.Specified});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black)),
        backgroundColor: CustomeColor.silver,
      ),
      body: Container(
          child: Center(
            child: Container(
              padding: EdgeInsets.only(top: 0, bottom: 50),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 200,height:200,decoration: BoxDecoration(shape: BoxShape.circle,image:DecorationImage(image: NetworkImage(
                          'https://i.pinimg.com/564x/99/7c/98/997c98690995eb77cb65cb88f39856b0.jpg'),fit: BoxFit.fill)),
                  ),
                  Center(
                      child:
                          Text(this.FullName, style: TextStyle(fontSize: 30))),
                  Center(
                      child: Text('Specification', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    height: 50,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: Center(
                        child: Text(this.Specified,
                            style: TextStyle(fontSize: 20))),
                  ),
                  Center(child: Text('Phone', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    height: 50,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: Center(
                        child:
                            Text(this.Phone, style: TextStyle(fontSize: 20))),
                  ),
                  Center(child: Text('Email', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    height: 50,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey),
                    child: Center(
                        child:
                            Text(this.Email, style: TextStyle(fontSize: 20))),
                  ),
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
