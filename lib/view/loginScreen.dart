import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
          child: new Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 260,
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
                    Container(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF375B41),
                            fontSize: 20.0
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)
                                  )
                                ]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.grey[100]))
                                  ),
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.email),
                                      labelText: 'E-mail ou CRM',
                                      labelStyle: TextStyle(
                                          color: Color(0xFF375B41)),
                                      border: InputBorder.none,
                                      hintText: "E-mail ou CRM",
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                    ),
                                  ),
                                ),

                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: _passController,
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.lock),
                                          labelText: 'Senha',
                                          labelStyle: TextStyle(
                                              color: Color(0xFF375B41)),
                                          border: InputBorder.none,
                                          hintText: "Senha",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          RaisedButton(
                            onPressed: () {
                              if (_emailController.text.isEmpty) {
                                print('===> VAZIO');
                              } else {
                                print('===> ${_emailController
                                    .text} + ${_passController.text}');
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(75.0)),
                            padding: const EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF33913F),
                                    Color(0xFF4CB849)
                                  ],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(75.0)),
                              ),
                              child: Container(
                                constraints: BoxConstraints(minWidth: 100.0,
                                    minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  'Acessar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          new GestureDetector(
                            onTap: () {
                              print("===> Esqueci minha senha");
                            },
                            child: Text(
                              'Esqueci minha senha',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF375B41)),
                            ),
                          ),
                          SizedBox(height: 20),
                          new GestureDetector(
                            onTap: () {
                              print("===> Cadastre-se");
                            },
                            child: Text(
                              'Cadastre-se',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF375B41)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
         ),
     );
  }

  Future<bool> onBackPressed() {
    SystemNavigator.pop();
  }
}

