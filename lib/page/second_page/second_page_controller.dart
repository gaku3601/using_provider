import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/input_text.dart';

class SecondPageController with ChangeNotifier {
  final Locator locator;

  SecondPageController({@required this.locator});

  // state
  InputTextController _inputTextController;
  String _text = '';

  // getter
  String get text => this._text;

  InputTextController get inputTextController => this._inputTextController;

  // setter
  set text(String text) {
    this._text = text;
    notifyListeners();
  }

  void init() {
    this._inputTextController = InputTextController(
        validator: this.textValidation, onChanged: this.changeText);
  }

  void textReset() {
    this._inputTextController.setField('reset!');
  }

  void changeText(String text) {
    this.text = text;
  }

  String textValidation(String text) {
    if (text.isEmpty) {
      return '入力しろ!';
    }
    return null;
  }

  void register() {
    if (this._inputTextController.onValidation()) {
      print('error');
      return;
    }
    print(this._inputTextController.text);
  }
}
