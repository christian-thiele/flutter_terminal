import 'package:flutter/material.dart';
import 'package:flutter_terminal/controller.dart';

import 'window_bar.dart';
import 'terminal_content.dart';

class TerminalWindow extends StatelessWidget {
  final String title;
  final TerminalController controller;

  const TerminalWindow({
    Key? key,
    required this.title,
    required this.controller,
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
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
