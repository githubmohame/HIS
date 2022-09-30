import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( bottomNavigationBar: BottomNavigationBar(value:,items: [BottomNavigationBarItem(label:"",icon: Image.asset(height:20,width:20,"assets/assets_phone_round2/icons/person.png")),
    BottomNavigationBarItem(label:"",icon: Icon(Icons.calendar_month_rounded)),
        BottomNavigationBarItem(label:"",icon: Icon(Icons.home))

    ]),
        body: ScrollConfiguration(
           behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
          Container(
            child: LayoutBuilder(builder: (context, constraint) {
              print(MediaQuery.of(context).size.width);
              return Container(
                width: MediaQuery.of(context).size.width<360.0?360:MediaQuery.of(context).size.width,
                height: constraint.maxHeight,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Color(0xFFf0f4f7)),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Text("V",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xFF0a6cc0),
                                          fontWeight: FontWeight.w900))),
                              Positioned(
                                left: 4,
                                top: 30,
                                child: Container(
                                    height: 4, width: 12, color: Colors.red),
                              ),
                              Positioned(
                                  left: 20,
                                  top: 0,
                                  child: Text("e",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Color(0xFF0770cc),
                                          fontWeight: FontWeight.w900))),
                              Positioned(
                                  left: 40,
                                  top: 0,
                                  child: Text("z",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Color(0xFF0770cc),
                                          fontWeight: FontWeight.w900))),
                              Positioned(
                                  left: 60,
                                  top: 0,
                                  child: Text("e",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Color(0xFF0770cc),
                                          fontWeight: FontWeight.w900))),
                              Positioned(
                                  left: 80,
                                  top: 0,
                                  child: Text("t",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Color(0xFF0770cc),
                                          fontWeight: FontWeight.w900))),
                              Positioned(
                                  left: 95,
                                  top: 0,
                                  child: Text("a",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Color(0xFF0770cc),
                                          fontWeight: FontWeight.w900))),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 300,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          height: 100,
                                          width: 80,
                                          'assets/assets_phone_round2/icons/call_doctor.png'),
                                      Text("مكالمة دكتور",style:TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          height: 100,
                                          width: 80,
                                          'assets/assets_phone_round2/icons/pharmacist.png'),
                                      Text("صيدلية",style:TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          height: 100,
                                          width: 80,
                                          'assets/assets_phone_round2/icons/doctor_detect.png'),
                                      Text("كشف عيادة",style:TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          height: 100,
                                          width: 80,
                                          'assets/assets_phone_round2/icons/doctor_analysis.png'),
                                      Text("تحليل منزلي",style:TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          height: 100,
                                          width: 80,
                                          'assets/assets_phone_round2/icons/surgery.png'),
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("خدمة او \nعملية",style:TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          height: 100,
                                          width: 80,
                                          'assets/assets_phone_round2/icons/home_visit.png'),
                                      Text("زيارة منزلية",style:TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "احجز كشف عيادة",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Container(
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextField(style: TextStyle(),
                                      decoration: InputDecoration(    
                                          prefixIcon: Icon(Icons.search),
                                          border: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.greenAccent),),
                                          hintText:
                                              "ابحث بالتخصص , اسم الدكتور , او المستشفي "),
                                    )))
                          ]),
                    ),
                    Container(
                      //padding: EdgeInsets.all(5),
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      margin: EdgeInsets.only(top: 10),
                      child:  Directionality(textDirection: TextDirection.rtl,
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,children:[
                           Image.asset(height:50,width:50,"assets/assets_phone_round2/icons/security.png"),
                           SizedBox(width: 20,),
                           Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            Text("تامين  الطبي",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold)),
                            Text("احجز دكتور واطلب دواء بالتامين",style:TextStyle(color: Colors.grey,fontSize: 15,fontWeight:FontWeight.bold )),
                            
                           ],)
                        ]),
                      
                    )
                ),Container(
                      padding: EdgeInsets.all(10),
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "  اطلب ادوية",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(height: 10)
                            ,
                            Container(
                                child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextField(style: TextStyle(),
                                      decoration: InputDecoration(    
                                          prefixIcon: Icon(Icons.search),
                                          border: OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.greenAccent),),
                                          hintText:
                                              "  ما الذي تبحث عن "),
                                    ))),SizedBox(height: 20,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                      Container(decoration: BoxDecoration(color:Color(0xFFe5f1ff),borderRadius: BorderRadius.circular(20)),height: 100,width:100,child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                                        Icon(Icons.phone,color:Color(0xFF29689d))
                                      ,Text("استشير\n صيدلي ",style:TextStyle(color:Color(0xFF29689d)))
                                      ],),),
                                      Container(decoration: BoxDecoration(color:Color(0xFFe5f1ff),borderRadius: BorderRadius.circular(20)),height: 100,width:100,child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                                        Icon(Icons.camera_alt_outlined,color:Color(0xFF29689d))
                                      ,Text("استشير\n صيدلي ",style:TextStyle(color:Color(0xFF29689d)))
                                      ],),),
                                      Container(decoration: BoxDecoration(color:Color(0xFFe5f1ff),borderRadius: BorderRadius.circular(20)),height: 100,width:100,child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                                        Image(height: 20,width: 20,image: AssetImage("assets/assets_phone_round2/icons/documents.png"))
                                      ,Text("/روشتة \n موافقة طبية",style:TextStyle(color:Color(0xFF29689d)))
                                      ],),)
                                    ],)
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      margin: EdgeInsets.only(top: 10),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image( image: AssetImage("assets/assets_phone_round2/icons/patients_bed_in_hospital.jpg"))
                          ,Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [
                              Text("زيارة منزلية",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
                            ,Text("اختيار التخصص و الدكتور",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold))
                            , Text("هجيلك البيت",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold))
                            ,SizedBox(height: 10,)
                            ,Container(margin: EdgeInsets.only(left: 20,right: 10),width:double.infinity,height: 50,
                              child: TextButton( style: ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith((states) => Color(0xFFe5f1ff,) ),overlayColor:MaterialStateProperty.resolveWith((states) => Color(0xFFe5f1ff)) ),onPressed: () {
                                
                              }, child:  Text("احجز الزيارة")),
                            )
                            ],),
                          )]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      margin: EdgeInsets.only(top: 10),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image( image: AssetImage("assets/assets_phone_round2/icons/medical_doctor_calling_by_phone.jpg"))
                          ,Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.end,children: [
                              Text("مكالمة الدكتور",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
                            ,Text("اامتابعة عبر مكالمة صوتية",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold))
                            , Text("او مكالمة فديو",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold))
                            ,SizedBox(height: 10,)
                            ,Container(margin: EdgeInsets.only(left: 120,right: 10),width:double.infinity,height: 50,
                              child: TextButton( style: ButtonStyle(backgroundColor:MaterialStateProperty.resolveWith((states) => Color(0xFFe5f1ff,) ),overlayColor:MaterialStateProperty.resolveWith((states) => Color(0xFFe5f1ff)) ),onPressed: () {
                                
                              }, child:  Text("احجز الان")),
                            )
                            ],),
                          )]),
                    ),
                    ],
                ),
              );
            }),
          ),
              ],
            ),
        ));
  }
}
