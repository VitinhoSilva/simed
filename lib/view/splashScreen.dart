import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:page_transition/page_transition.dart';
import 'package:simed/view/loginScreen.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';


class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      alignment: Alignment.center
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: _AnimatedLiquidLinearProgressIndicator(),
              ),
            ],
         ),
       ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((_){
      Navigator.pushNamed(context, "/login");
//      Navigator.push(
//          context, PageTransition(
//          type: PageTransitionType.leftToRight,
//          duration: Duration(seconds: 3),
//            child: loginScreen()
//       )
//      );
    });
  }
}

class _AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _AnimatedLiquidLinearProgressIndicatorState();
}

class _AnimatedLiquidLinearProgressIndicatorState
    extends State<_AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 9),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Center(
      child: Container(
        width: double.infinity,
        height: 75.0,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: LiquidLinearProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Color(0xFF33913F)),
          borderRadius: 12.0,
          center: Text(
            "${percentage.toStringAsFixed(0)}%",
            style: TextStyle(
              color: Color(0xFF4CB849),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}





