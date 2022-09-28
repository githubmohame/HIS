import 'package:flutter/material.dart';


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
      appBar: PreferredSize(
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
            child: AppBar(
              shadowColor: Colors.transparent,
              bottomOpacity: 0,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              title: Center(
                child: Text('Paitent Info', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      body: PatientInfoPhone(Adress: Adress,FullName: FullName,Phone: Phone),
    );
  }
}
class PatientInfoPhone extends StatefulWidget {
  String FullName;
  String Phone;
  String Adress;
  List<TextEditingController> textEditingController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  PatientInfoPhone({required this.FullName, required this.Phone, required this.Adress,Key? key}) : super(key: key);

  @override
  State<PatientInfoPhone> createState() => _PatientInfoPhoneState();
}

class _PatientInfoPhoneState extends State<PatientInfoPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(width:double.infinity,height:double.infinity,decoration:BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Text('Full Name', style: TextStyle(fontSize: 30)))
                  ,
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                   decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                  textAlign: TextAlign.center,
                  controller:widget.textEditingController[0],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the FullName',
                      border: InputBorder.none),
                    ),
                  ),
                  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Country', style: TextStyle(fontSize: 20)),
                Text('city', style: TextStyle(fontSize: 20)),
              ],
            ),
            Center(
              child: Row(
                   
                  children: [ SizedBox(width: 20,),
                    Expanded(
                      child: Container(height: 50, decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),child: DropdownButton<String>(items: [DropdownMenuItem<String>(value: "kkk",child: Text("kkk"))], onChanged:(value) => null,)),
                    ),
                    SizedBox(width: 20,)
                    ,
                    Expanded(
                      child: Container(height:50 ,decoration:BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(underline: Container(),items: [], onChanged:(value) => null,)),
                    ),
                     SizedBox(width: 20,),
                  ]),
            ),
                  Center(child: Text('phone', style: TextStyle(fontSize: 30))),
                  Container(
                    width: 500,
                    padding: EdgeInsets.only(left: 50),
                   decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  controller:widget.textEditingController[2],
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter the phone',
                      border: InputBorder.none),
                    ),
                  ),Row(children:[
                    SizedBox(width: 20,),
                    Expanded(child: ElevatedButton(child:Text('Update'),onPressed: ()=>null,))
                    ,SizedBox(width:20)
                    ,Expanded(child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red)),child:Text(style:TextStyle(backgroundColor: Colors.red),'Delete'),onPressed: ()=>null,)),
                    SizedBox(width:20)
                    ,
                    Expanded(
                    child:ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange)),child:Text(style:TextStyle(backgroundColor: Colors.orange),'Documents'),onPressed: ()=>null,))
                  ,SizedBox(width:20)
                ])
                ],
              ),
            ),
          ),
          );
  }
}

class PatientInfoComputer extends StatefulWidget {
   String FullName;
  String Phone;
  String Adress;
  List<TextEditingController> textEditingController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  PatientInfoComputer(
      {required this.FullName, required this.Phone, required this.Adress}) {
    textEditingController[0].text = FullName;
    textEditingController[1].text = Phone;
    textEditingController[2].text = Adress;
  }
  @override
  State<PatientInfoComputer> createState() => _PatientInfoComputerState();
}

class _PatientInfoComputerState extends State<PatientInfoComputer> {
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 500,
                          width: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd,
                                  colors: [
                                Color.fromARGB(255, 128, 187, 236),
                                Color.fromARGB(255, 249, 246, 246)
                              ])),
                          child: Center(
      child:  PatientInfoPhone(Adress:  widget.Adress,FullName: widget.FullName,Phone: widget.Phone,)
    ) 
                          /**/
                          )
                    ])));;
  }
}
 