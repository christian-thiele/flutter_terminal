import 'package:flutter/material.dart';
import 'package:flutter_terminal/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 512.0) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(
                    (constraints.maxWidth > 1024.0) ? 128.0 : 64.0),
                child: AspectRatio(
                  aspectRatio: 1.6,
                  child: TerminalWindow(
                    title: 'ssh',
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: TerminalWindow(
                  title: 'ssh',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
