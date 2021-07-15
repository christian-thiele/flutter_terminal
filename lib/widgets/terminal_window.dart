import 'package:flutter/material.dart';
import 'package:flutter_terminal/widgets/window_bar.dart';

import 'terminal_content.dart';

class TerminalWindow extends StatelessWidget {
  final String title;
  final Stream<String> Function(String text)? commandHandler;

  const TerminalWindow({
    Key? key,
    required this.title,
    this.commandHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(4.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WindowBar(title: title),
          Expanded(
            child: TerminalContent(
              commandHandler: commandHandler,
            ),
          )
        ],
      ),
    );
  }
}
