import 'package:flutter/material.dart';
import 'window_button.dart';

class WindowBar extends StatelessWidget {
  final String title;

  const WindowBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 32.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WindowButton(color: Colors.grey),
                WindowButton(color: Colors.green),
                WindowButton(color: Colors.red),
              ],
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
