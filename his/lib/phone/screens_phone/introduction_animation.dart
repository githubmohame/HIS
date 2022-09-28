import 'dart:async';
//import 'dart:html';
//import 'dart:html';
import "dart:math" as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);
  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  double top = 0;
  double opacity = 0;
  double left = 500;
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Size size = MediaQuery.of(context).size;
      top = size.height / 2;
      left = size.width / 2;
      opacity = 1;
      setState(() {});
      print("done");
    });
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
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
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      body: Container(decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [
                    Color.fromARGB(255, 128, 187, 236),
                    Color.fromARGB(255, 249, 246, 246)
                  ])),
        child: AnimatedOpacity(
          duration: Duration(seconds: 3),
          opacity: opacity.toDouble(),
          child: SafeArea(
            child: Stack(children: [
              AnimatedPositioned(
                  curve: Curves.easeInCirc,
                  top: top.toDouble(),
                  left: left.toDouble(),
                  child: Container(
                    height: 500,
                    width: 500,
                    child: Column( 
                      children: [
                        Container(height: 200,width:200,
                          child: SvgPicture.asset(
                              'assets/icons/hospital-svgrepo-com.svg',
                              fit: BoxFit.cover),
                        ),
                      Text('HIS', style: TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                  duration: Duration(seconds: 3))
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Route _createRoute() {
  return PageRouteBuilder(transitionDuration: Duration(seconds:0),
    pageBuilder: (context, animation, secondaryAnimation) => const MainScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeInOutCubicEmphasized;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

/*class MyRoute extends MaterialPageRoute {
  MyRoute({required super.builder});
  @override
  Duration get transitionDuration => Duration(seconds: 10);
}

class CustomPageRoute extends PageRouteBuilder {
  CustomPageRoute( ):super(transitionsBuilder: ,pageBuilder:(BuildContext, Animation , Animation2 ) =>MainScreen()
  )
  ;

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => throw UnimplementedError();
}
*/