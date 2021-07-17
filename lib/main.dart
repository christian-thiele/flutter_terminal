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
      // TODO edit for page title
      title: 'Terminal',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          // window title
          caption: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          // window content 1
          bodyText1: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w400,
          ),
          // window content 2
          bodyText2: TextStyle(
            color: Colors.green,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}
