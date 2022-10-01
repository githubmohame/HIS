import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:his/phone_round1/main_screen.dart';
//import 'package:http/http.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({Key? key}) : super(key: key);

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late AnimationStatus _animationStatus = AnimationStatus.dismissed;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
        _animation.isCompleted ? _animationController.reverse() : null;
        _animation.isDismissed ? _animationController.forward() : null;
        ;
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Transform(
                        alignment: FractionalOffset.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.002)
                          ..rotateY(pi * _animation.value),
                        child: GestureDetector(
                          onTap: () {
                            if (_animationStatus == AnimationStatus.dismissed) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          },
                          child: _animation.value <= 0.5
                              ? Container(
                                  color: Colors.transparent,
                                  width: 40,
                                  height: 40,
                                  child: Image(
                                      height: 20,
                                      width: 20,
                                      image: AssetImage(
                                          'assets/assets_phone_round2/icons/heart.png')),
                                )
                              : Container(
                                  color: Colors.transparent,
                                  width: 40,
                                  height: 40,
                                  child: Image(
                                      height: 20,
                                      width: 20,
                                      image: AssetImage(
                                          'assets/assets_phone_round2/icons/heart.png')),
                                ),
                        ),
                      )),
                      Text("Loading",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ],
                  ))
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }
}
