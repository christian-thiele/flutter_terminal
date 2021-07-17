import 'package:flutter/material.dart';
import 'package:flutter_terminal/controller.dart';
import 'package:flutter_terminal/widgets.dart';

class TerminalPage extends StatefulWidget {
  final CommandHandler commandHandler;
  final String title;

  const TerminalPage({
    Key? key,
    required this.title,
    required this.commandHandler,
  }) : super(key: key);

  @override
  _TerminalPageState createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  late final _terminalController =
      TerminalController(commandHandler: widget.commandHandler);

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
                  child: _buildTerminal(),
                ),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: _buildTerminal(),
              ),
            );
          }
        },
      ),
    );
  }

  _buildTerminal() {
    return TerminalWindow(title: widget.title, controller: _terminalController);
  }
}
