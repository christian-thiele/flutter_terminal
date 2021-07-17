import 'package:flutter/material.dart';
import 'package:flutter_terminal/controller.dart';

class TerminalContent extends StatefulWidget {
  final TerminalController controller;

  const TerminalContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _TerminalContentState createState() => _TerminalContentState();
}

class _TerminalContentState extends State<TerminalContent> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    widget.controller.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    final history = widget.controller.value.history.endsWith('\n')
        ? widget.controller.value.history
            .substring(0, widget.controller.value.history.length - 1)
        : widget.controller.value.history;
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Container(
        color: Colors.black,
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText1!,
          child: Scrollbar(
            controller: _scrollController,
            radius: Radius.circular(4.0),
            isAlwaysShown: true,
            showTrackOnHover: true,
            interactive: true,
            thickness: 8.0,
            hoverThickness: 8.0,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (history.length > 0)
                      Text(
                        history,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    if (widget.controller.value.mode != TerminalMode.waiting)
                      Row(
                        children: [
                          if (widget.controller.value.mode == TerminalMode.idle)
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
    widget.controller.removeListener(_listener);
    super.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
  }

  void _submit(String value) {
    _textEditingController.text = '';
    widget.controller.onInput(value);
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 20))
        .then((value) => _scrollController.position.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 50),
              curve: Curves.easeInOut,
            ));
  }

  void _listener() {
    if (mounted) {
      setState(() {});
      _focusNode.requestFocus();
      _scrollToBottom();
    }
  }
}
