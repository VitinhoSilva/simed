import 'package:flutter/material.dart';
import 'package:simed/screens/homeScreen.dart';
import 'package:simed/screens/loginScreen.dart';
import 'package:simed/screens/splashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: splashScreen(),
        debugShowCheckedModeBanner: true,
        routes: <String, WidgetBuilder> {
          '/login': (BuildContext context) => loginScreen(),
          '/home': (BuildContext context) => MainWidget(),
        },
      );
  }
}



