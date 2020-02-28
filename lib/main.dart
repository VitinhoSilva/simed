import 'package:flutter/material.dart';
import 'package:simed/view/loginScreen.dart';
import 'package:simed/view/splashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          debugShowCheckedModeBanner: true,
          home: splashScreen(),
        routes: <String, WidgetBuilder> {
          '/login': (BuildContext context) => loginScreen(),
        },
      );
  }
}



