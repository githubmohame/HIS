import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:his/phone_round1/loading_screen.dart';

import 'flip_card.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<Response> api() async {
    Response s =
        await Dio().get("https://jsonplaceholder.typicode.com/posts/1");
    //print(s.data);
    return s;
  }

  Future<String> getData() {
    return Future.delayed(Duration(seconds: 2), () {
      return "I am data";
      // throw Exception("Custom Error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }
          if (snap.connectionState == ConnectionState.done) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  appBar: AppBar(
                      backgroundColor:
                          Color.fromARGB(255, 34, 107, 235).withOpacity(0.9),
                      leading: Icon(Icons.arrow_back),
                      title: Text('ختر التخصص')),
                  body: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: "اختر التخصص",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      LayoutBuilder(builder: (context, constraint) {
                        return Container(
                          height: MediaQuery.of(context).size.height - 150,
                          child: ListView.builder(
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              if (index % 10 == 0) {
                                return Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text(
                                    "التخصص",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                              }
                              return Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: BorderDirectional(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: Row(
                                  children: [
                                    Image(
                                        height: 30,
                                        width: 30,
                                        image: AssetImage(
                                            "assets/assets_phone_round2/icons/heart.png")),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "طب الاسرة",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ));
          }
          return Scaffold(
            body: Container(color: Colors.white),
          );
        });
  }
}
