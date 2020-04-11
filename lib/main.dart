
import 'package:flutter/material.dart';
import 'package:appnews/ui/NewsScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final materialApp = MaterialApp(
      title: '',
      home: new NewScreen(),
    );
    return materialApp;
  }
}

