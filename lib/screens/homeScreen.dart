import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simed/screens/auth_page.dart';
import 'package:simed/screens/calendar_page.dart';
import 'package:simed/screens/main_page.dart';
import 'package:simed/util/builderUtil.dart';
import 'package:simed/util/drawUtil.dart';

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
          text: Text('MAIN', style: TextStyle(color: Colors.black54)),
          icon: Icon(Icons.home, color: Colors.black54),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'CALENDAR',
            style: TextStyle(color: Colors.black54),
          ),
          icon: Icon(Icons.calendar_today, color: Colors.black54),
          page: CalendarPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.black54),
          ),
          icon: Icon(Icons.settings, color: Colors.black54),
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
            'SIGN IN',
            style: TextStyle(color: Colors.black54),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.black54,
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
            colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
