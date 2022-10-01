import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:his/phone_round1/choose_specialist.dart';

import 'flip_card.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
     return Scaffold(body: FlipCard());
  }
}
