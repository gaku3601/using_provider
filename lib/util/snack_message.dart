import 'package:flutter/material.dart';

class SnackMessage {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();

  static void show(String text) {
    scaffoldMessengerState.currentState
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
