import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/input_text.dart';
import 'package:using_provider/atom/loading.dart';
import 'package:using_provider/page/first_page/first_page.dart';
import 'package:using_provider/util/navigate.dart';

class SecondPageController with ChangeNotifier {
  final Locator locator;

  SecondPageController({@required this.locator});

  // state
  InputTextController _inputTextController1;
  InputTextController _inputTextController2;
  String _text1 = '';
  String _text2 = '';

  // getter
  String get text1 => this._text1;

  String get text2 => this._text2;

  InputTextController get inputTextController1 => this._inputTextController1;

  InputTextController get inputTextController2 => this._inputTextController2;

  // setter
  set text1(String text) {
    this._text1 = text;
    notifyListeners();
  }

  set text2(String text) {
    this._text2 = text;
    notifyListeners();
  }

  void init() {
    this._inputTextController1 = InputTextController(
        validator: this.textValidation, onChanged: this.changeText1);
    this._inputTextController2 = InputTextController(
        validator: this.textValidation, onChanged: this.changeText2);
  }

  void textReset() {
    this._inputTextController1.setField('reset1!');
    this._inputTextController2.setField('reset2!');
  }

  void changeText1(String text) {
    this.text1 = text;
  }

  void changeText2(String text) {
    this.text2 = text;
  }

  String textValidation(String text) {
    if (text.isEmpty) {
      return '入力しろ!';
    }
    return null;
  }

  void register() {
    if (this._inputTextController1.onValidation() ||
        this._inputTextController2.onValidation()) {
      print('error');
      return;
    }
    print(this._inputTextController1.text);
    print(this._inputTextController2.text);
  }

  Future loading() async {
    this.locator<LoadingController>().loading(() async {
      await new Future.delayed(new Duration(seconds: 3));
    });
  }

  void move() {
    Navigate.pushReplacement(page: FirstPage());
  }
}
