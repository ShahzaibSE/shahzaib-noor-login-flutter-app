import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// Widget.
import './user-login.widget.dart';
import './homepage.widget.dart';
import './user-register.widget.dart';

void main() {
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final routes = <String, WidgetBuilder>{
    UserLogin.tag: (context) => UserLogin(),
    HomePage.tag: (context) => HomePage(),
    UserRegister.tag: (context) => UserRegister()
  };
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito'
      ),
      home: UserLogin(),
      routes: routes
    );
  }
}
