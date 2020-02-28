import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simed/screens/exitScreen.dart';
import 'package:simed/screens/profileScreen.dart';
import 'package:simed/screens/mainScreen.dart';
import 'package:simed/util/builderUtil.dart';
import 'package:simed/util/drawUtil.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    ClassBuilder.registerClasses();
    super.initState();
    _drawerController = new KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('INÍCIO', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.home, color: Colors.black),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'ÁREA DO ASSOCIADO',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.person, color: Colors.black),
          page: CalendarPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'CARTEIRA DE ',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.info, color: Colors.black),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'SERVIÇOS',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.work, color: Colors.black),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'SIMED+',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.add, color: Colors.black),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'AGENDA',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.calendar_today, color: Colors.black),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'NOTICÍAS',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.fiber_new, color: Colors.black),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'ASSOCIE-SE',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.accessibility, color: Colors.black),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'DENUNCIE',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(Icons.add_alert, color: Colors.black),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset(
              'assets/logo.png',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SAIR',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return AuthPage();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE5E6E7), Color(0xFFE5E6E7)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
