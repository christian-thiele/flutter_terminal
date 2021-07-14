import 'package:flutter/material.dart';
import 'package:flutter_terminal/widgets/window_bar.dart';

import 'terminal_content.dart';

class TerminalWindow extends StatelessWidget {
  final String title;
  final String text;
  final void Function(String text)? onSend;

  const TerminalWindow({
    Key? key,
    required this.title,
    required this.text,
    this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(4.0),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WindowBar(title: title),
          Expanded(
            child: TerminalContent(
              text: text,
              onSend: onSend,
            ),
          )
        ],
      ),
    );
  }
}
