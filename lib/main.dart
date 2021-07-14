import 'package:flutter/material.dart';

import 'pages.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terminal',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.green,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}
