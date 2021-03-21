import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/loading.dart';
import 'package:using_provider/page/second_page/second_page.dart';
import 'package:using_provider/repository/user_repository.dart';
import 'package:using_provider/util/navigate.dart';
import 'package:using_provider/util/snack_message.dart';

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
    this.locator<LoadingController>().loading(() async {
      await new Future.delayed(new Duration(seconds: 3));
    });
  }

  void onSnack() {
    SnackMessage.show('snackbar!!!');
  }

  void increment() {
    this.__count = this._count + 1;
  }

  void increment2() {
    this.__count2 = this._count2 + 1;
  }

  void move() {
    Navigate.pushReplacement(page: SecondPage());
  }

  Future fetchUser() async {
    this.locator<LoadingController>().loading(() async {
      final userName = await this.locator<UserRepository>().fetchName();
      print(userName);
      SnackMessage.show('ユーザを取得しました！');
    });
  }

  // dart error
  Future error() async {
    this.locator<LoadingController>().loading(() async {
      // ここで例外が発生した想定
      final profile = await this.locator<UserRepository>().fetchProfile();
      print(profile);
      SnackMessage.show('プロフィールを取得しました！');
    });
  }

  // flutter sdk error
  void error2() {
    throw Exception('error');
  }
}
