import 'package:flutter/material.dart';

class FirstPageController with ChangeNotifier {
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

  void increment() {
    this.__count = this._count + 1;
  }

  void increment2() {
    this.__count2 = this._count2 + 1;
  }
}
