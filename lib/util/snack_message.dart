import 'package:flutter/material.dart';

class SnackMessage {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();

  void show(String text) {
    this
        .scaffoldMessengerState
        .currentState
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
