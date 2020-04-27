import 'package:appnews/ui/HomeScreen.dart';
import 'package:appnews/ui/LoginScreen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final materialApp = MaterialApp(
      title: '',
      home: new NewScreen(),
//      home: new LoginScreen(),
    );
    return materialApp;
  }

}

