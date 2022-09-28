//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                child: Text('Take Time', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                  Color.fromARGB(255, 128, 187, 236),
                  Color.fromARGB(255, 249, 246, 246)
                ])),
            child: LayoutBuilder(builder: (context, constraint) {
              print(((constraint.maxWidth)/(160+15)) );
              return GridView.builder(
                itemCount: 100,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ((constraint.maxWidth)/(160+15)).toInt(),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return LayoutBuilder(
                    builder: (context,constraint) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientInfoScreen(
                                      Phone: '0998876544',
                                      Adress: 'looo',
                                      FullName: 'oooooo',
                                    ))),
                        child: Container(
                          height:150, 
                          width: constraint.maxWidth,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 0),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(100))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      width: 10,
                                      height: 10,
                                      child: CircularProgressIndicator()),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100)),
                                    child: Image.network(
                                      'https://i.pinimg.com/564x/99/7c/98/997c98690995eb77cb65cb88f39856b0.jpg',
                                      fit: BoxFit.cover,
                                      height: constraint.minHeight/3,
                                      width: constraint.maxWidth,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  HeartButton(),
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: constraint.maxWidth/8,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      size: 1,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ],
                              ),
                              Text(
                                  maxLines: 5,
                                  'Mihamed Ahmed Ali Soliman',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              Text(
                                  maxLines: 1,
                                  'SPECIALIST',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                      );
                    }
                  );
                },
              );
            })));
  }
}

/**/
class HeartButton extends StatefulWidget {
  const HeartButton({Key? key}) : super(key: key);

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return click
        ? IconButton(
            onPressed: () => setState(() {
                  click = false;
                }),
            icon: Icon(CupertinoIcons.heart_fill, color: Colors.red))
        : IconButton(
            onPressed: () => setState(() {
                  click = true;
                }),
            icon: Icon(CupertinoIcons.heart,
                color: Color.fromARGB(255, 30, 26, 26)));
  }
}







/*ListView.separated(separatorBuilder: (context, index) {
             return SizedBox(height: 50,);
          },
            itemCount: 100,
            itemBuilder: (context, index) {
              return GestureDetector(onTap:()=>Navigator.push( context,MaterialPageRoute(builder: (context) =>  PatientInfoScreen(Phone: '0998876544',Adress: 'looo',FullName: 'oooooo',))),
                child: Container(height: 100,width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(100))),
                  child: Column(
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Container(width:10,height:10,child: CircularProgressIndicator(  )),
                        Container(width: 50,height:50,decoration: BoxDecoration(shape: BoxShape.rectangle,image:DecorationImage(image: NetworkImage(
                            'https://i.pinimg.com/564x/99/7c/98/997c98690995eb77cb65cb88f39856b0.jpg'),fit: BoxFit.fill)),
                    ),
                      ]),
                      Text(maxLines: 5,
                          'Name:Mihamed Ahmed Ali Soliman',
                          style:
                              TextStyle(overflow: TextOverflow.ellipsis, fontSize: 10))
                    ],
                  ),
                ),
              );
            },
          )*/

/*
                        Stack(alignment: Alignment.topRight, children: [
                          Container(width:10,height:10,child: CircularProgressIndicator(  )),                   ]),
                        SizedBox(height:100),
                        Text(maxLines: 5,
                            'Name:Mihamed Ahmed Ali Soliman',
                            style:
                                TextStyle(overflow: TextOverflow.ellipsis, fontSize: 10))
                      */ 