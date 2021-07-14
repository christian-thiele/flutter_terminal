import 'package:flutter/material.dart';

class WindowButton extends StatelessWidget {
  final Color color;
  final VoidCallback? onTap;

  const WindowButton({
    Key? key,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
      child: Material(
        shape: CircleBorder(side: BorderSide.none),
        color: color,
        child: SizedBox(
          height: 12.0,
          width: 12.0,
        ),
      ),
    );
  }
}
