import 'dart:async';

import 'package:flutter/cupertino.dart';

/// Handles commands, returns if command has been found.
typedef CommandHandler = Future<bool> Function(
    TerminalController controller, String command, List<String> args);

enum TerminalMode { idle, waiting, requestInput }

class TerminalState {
  final TerminalMode mode;
  final String history;

  TerminalState(this.mode, this.history);

  TerminalState addText(String text, [TerminalMode? mode]) {
    final newText = history.isEmpty ? text : history + text;

    return TerminalState(mode ?? this.mode, newText);
  }
}

class TerminalController extends ValueNotifier<TerminalState> {
  static const boolTrue = ['y', 'yes', 'true', '1', 'ja', 'j'];

  CommandHandler? commandHandler;
  Completer<String>? _inputCompleter;

  TerminalController({this.commandHandler})
      : super(TerminalState(TerminalMode.idle, ''));

  void onInput(String input) {
    switch (value.mode) {
      case TerminalMode.idle:
        _onCommand(input);
        break;
      case TerminalMode.waiting:
        // no
        break;
      case TerminalMode.requestInput:
        _inputCompleter?.complete(input);
        break;
    }
  }

  void _onCommand(String input) async {
    value = value.addText(
        (value.history.isEmpty || value.history.endsWith('\n'))
            ? '\$ $input\n'
            : '\n\$ $input\n',
        TerminalMode.waiting);
    final args = input.split(' ');
    if (await commandHandler?.call(this, args[0], args.skip(1).toList()) ??
        false) {
      value = TerminalState(TerminalMode.idle, value.history);
    } else {
      value = value.addText('Command not found: ${args[0]}', TerminalMode.idle);
    }
  }

  Future<String> requestInput() async {
    _inputCompleter = Completer();
    value = TerminalState(TerminalMode.requestInput, value.history);
    final input = await _inputCompleter!.future;
    _inputCompleter = null;
    value = value.addText(input + '\n', TerminalMode.waiting);
    return input;
  }

  Future<int> requestInputInt() async {
    int? x;
    while (x == null) {
      final str = await requestInput();
      x = int.tryParse(str);
      if (x == null) {
        println('Invalid integer: $str');
      }
    }
    return x;
  }

  Future<double> requestInputDouble() async {
    double? x;
    while (x == null) {
      final str = await requestInput();
      x = double.tryParse(str);
      if (x == null) {
        println('Invalid double: $str');
      }
    }
    return x;
  }

  Future<bool> requestInputBool() async {
    final str = await requestInput();
    return boolTrue.contains(str.toLowerCase());
  }

  void print(String s) {
    value = value.addText(s);
  }

  void println(String s) => print('$s\n');
}
