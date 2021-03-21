import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/page/second_page/second_page.dart';
import 'package:using_provider/util/navigate.dart';

class ErrorPageController with ChangeNotifier {
  final Locator locator;

  ErrorPageController({@required this.locator});

  void move() {
    Navigate.pushReplacement(page: SecondPage());
  }
}
