import 'package:flutter/material.dart';

class TerminalContent extends StatefulWidget {
  final String text;
  final void Function(String text)? onSend;

  const TerminalContent({
    Key? key,
    this.text = '',
    this.onSend,
  }) : super(key: key);

  @override
  _TerminalContentState createState() => _TerminalContentState();
}

class _TerminalContentState extends State<TerminalContent> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Container(
        color: Colors.black,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText1!,
          child: Scrollbar(
            radius: Radius.circular(4.0),
            isAlwaysShown: true,
            showTrackOnHover: true,
            interactive: true,
            thickness: 8.0,
            hoverThickness: 8.0,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ ',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Expanded(
                          child: EditableText(
                            paintCursorAboveText: true,
                            focusNode: _focusNode,
                            controller: _textEditingController,
                            onSubmitted: _submit,
                            cursorColor:
                                Theme.of(context).textTheme.bodyText1!.color!,
                            style: Theme.of(context).textTheme.bodyText1!,
                            backgroundCursorColor:
                                Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
  }

  void _submit(String value) {
    _textEditingController.text = '';
    widget.onSend?.call(value);
    _focusNode.requestFocus();
  }
}
