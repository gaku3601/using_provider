import 'package:flutter/material.dart';

class SnackBarController with ChangeNotifier {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();

  void onSnackbar(String text) {
    this
        .scaffoldMessengerState
        .currentState
        .showSnackBar(SnackBar(content: Text(text)));
  }
}
