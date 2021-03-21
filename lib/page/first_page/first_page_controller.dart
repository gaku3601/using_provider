import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/loading.dart';
import 'package:using_provider/util/navigate.dart';
import 'package:using_provider/util/snack_message.dart';
import 'package:using_provider/page/second_page/second_page.dart';

class FirstPageController with ChangeNotifier {
  final Locator locator;

  FirstPageController({@required this.locator});

  int _count = 0;
  int _count2 = 0;

  // getter
  int get count => this._count;

  int get count2 => this._count2;

  // setter
  set __count(int count) {
    this._count = count;
    notifyListeners();
  }

  set __count2(int count) {
    this._count2 = count;
    notifyListeners();
  }

  Future loading() async {
    this.locator<LoadingController>().startLoading();
    await new Future.delayed(new Duration(seconds: 3));
    this.locator<LoadingController>().endLoading();
  }

  void onSnack() {
    this.locator<SnackMessage>().show('snackbar!!!');
  }

  void increment() {
    this.__count = this._count + 1;
  }

  void increment2() {
    this.__count2 = this._count2 + 1;
  }

  void move() {
    this.locator<Navigate>().pushReplacement(page: SecondPage());
  }
}
