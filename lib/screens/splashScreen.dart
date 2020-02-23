import 'package:flutter/material.dart';
import 'package:simed/screens/loginScreen.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 270,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 200,
                      padding: new EdgeInsets.only(top: 110),
                      child: Container(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo.png'),
                              alignment: Alignment.center
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => loginScreen())
      );
    });
  }
}
