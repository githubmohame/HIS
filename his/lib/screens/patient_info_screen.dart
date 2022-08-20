import 'package:flutter/material.dart';
import 'package:his/screens/main_screen.dart';

import '../themes/colors.dart';

class PatientInfoScreen extends StatelessWidget {
  String FullName;
  String Phone;
  String Adress;
  List<TextEditingController> textEditingController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  PatientInfoScreen(
      {required this.FullName, required this.Phone, required this.Adress}) {
    textEditingController[0].text = FullName;
    textEditingController[1].text = Phone;
    textEditingController[2].text = Adress;
  }
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
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/564x/99/7c/98/997c98690995eb77cb65cb88f39856b0.jpg'),
                            fit: BoxFit.fill)),
                  ),
                  Center(
                      child: Text('Address', style: TextStyle(fontSize: 30)))
                  ,
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                    child: TextFormField(
                  textAlign: TextAlign.center,
                  controller:textEditingController[0],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the FullName',
                      border: InputBorder.none),
                    ),
                  ),
                  Center(
                      child: Text('Address', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                    child: TextFormField(
                  textAlign: TextAlign.center,
                  controller:textEditingController[1],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the Adress',
                      border: InputBorder.none),
                    ),
                  ),
                  Center(child: Text('phone', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey),
                    child: TextFormField(
                  textAlign: TextAlign.center,
                  controller:textEditingController[2],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the phone',
                      border: InputBorder.none),
                    ),
                  ),Expanded(child: Row(children:[
                    Expanded(child: ElevatedButton(child:Text('Update'),onPressed: ()=>null,))
                    ,SizedBox(width:20)
                    ,Expanded(child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red)),child:Text(style:TextStyle(backgroundColor: Colors.red),'Delete'),onPressed: ()=>null,)),
                    SizedBox(width:20)
                    ,
                    Expanded(
                    child:ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange)),child:Text(style:TextStyle(backgroundColor: Colors.orange),'Documents'),onPressed: ()=>null,))
                ]))
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
