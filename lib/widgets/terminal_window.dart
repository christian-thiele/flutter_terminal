import 'package:flutter/material.dart';
import 'package:flutter_terminal/widgets/window_bar.dart';

class TerminalWindow extends StatelessWidget {
  final String title;

  const TerminalWindow({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      borderRadius: BorderRadius.circular(8.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WindowBar(title: title),
          Expanded(
            child: Container(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyText1!,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('test'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
