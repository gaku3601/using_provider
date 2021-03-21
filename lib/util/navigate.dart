import 'package:flutter/material.dart';

class Navigate {
  static GlobalKey<NavigatorState> key = new GlobalKey<NavigatorState>();

  static void push<T extends Widget, N>({@required T page, N args}) {
    key.currentState.push<dynamic>(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: args),
      ),
    );
  }

  static void pushReplacement<T extends Widget, N>({@required T page, N args}) {
    key.currentState.pushReplacement(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: args),
      ),
    );
  }

  /// 全ての履歴を削除し、新たなページへ遷移する
  static void pushAndAllClear<T extends Widget, N>({@required T page, N args}) {
    key.currentState.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: args),
      ),
      (_) => false,
    );
  }

  static void pop() {
    key.currentState.pop();
  }
}
