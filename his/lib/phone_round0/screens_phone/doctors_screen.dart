import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:his/phone_round0/screens_phone/patients_screen.dart';

import '../themes/colors.dart';
import 'doctor_info_screen.dart';
import 'patient_info_screen.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  TextEditingController textController = TextEditingController();
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
                child: Text('Doctors List', style: TextStyle(fontSize: 30)),
              ),
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        body: LayoutBuilder(builder: (context, const1) {
          return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [
                    Color.fromARGB(255, 128, 187, 236),
                    Color.fromARGB(255, 249, 246, 246)
                  ])),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: textController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: 'Enter the FullName',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    height: const1.maxHeight - 110,
                    child: LayoutBuilder(builder: (context, constraint) {
                      print(((constraint.maxWidth) / (160 + 15)));
                      return Container(
                        height: constraint.maxHeight - 50,
                        child: GridView.builder(
                          itemCount: 100,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      ((constraint.maxWidth) / (160 + 15))
                                          .toInt(),
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return LayoutBuilder(
                                builder: (context, constraint) {
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorInfoScreen(url:"https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                                              phone: '0998876544',
                                              email: "ggyyyu",
                                              specified: "jjuuiiuuiii",
                                              fullName: 'oooooo',
                                            ))),
                                child: Container(
                                  height: 150,
                                  width: constraint.maxWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 0),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                              width: 10,
                                              height: 10,
                                              child:
                                                  CircularProgressIndicator()),
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100)),
                                            child: Image.network(
                                              'https://img.freepik.com/free-vector/arabic-doctor-with-medical-icon-hand-drawn-sketch-vector-background_460848-10333.jpg?w=996&t=st=1664293795~exp=1664294395~hmac=9de428936eec93433fb11629d9bc18bac9282db7ebafb8c547ce74c9fd70048f',
                                              fit: BoxFit.cover,
                                              height: constraint.minHeight / 2,
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
                                            itemSize: constraint.maxWidth / 8,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
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
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ));
        }));
  }
}
/*



*/