import 'package:flutter/material.dart';
import 'package:flutter_terminal/controller.dart';
import 'package:flutter_terminal/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return TerminalPage(
      // TODO edit window title
      title: 'My Terminal',
      commandHandler: _handleCommand,
    );
  }

  // TODO implement terminal commands
  // Return true if command has been handled, return false for "not found" message.
  // These are example commands:
  Future<bool> _handleCommand(
      TerminalController controller, String command, List<String> args) async {
    switch (command.toLowerCase()) {
      case 'add':
        try {
          final x1 = double.parse(args[0]);
          final x2 = double.parse(args[1]);
          controller.println('$x1 + $x2 = ${x1 + x2}');
        } catch (e) {
          controller.println('Enter first number:');
          final x1 = await controller.requestInputDouble();
          controller.println('Enter second number:');
          final x2 = await controller.requestInputDouble();
          controller.println('$x1 + $x2 = ${x1 + x2}');
        }
        return true;
      case 'booltest':
        controller.println('Yes or No?');
        final answer = await controller.requestInputBool();
        if (answer) {
          controller.println('You answered YES!');
        } else {
          controller.print('You answered NO!');
        }
        return true;
    }

    return false;
  }
}
