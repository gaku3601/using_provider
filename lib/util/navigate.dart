import 'package:flutter/material.dart';

class Navigate {
  final GlobalKey<NavigatorState> key = new GlobalKey<NavigatorState>();

  void push<T extends Widget, N>({@required T page, N args}) {
    key.currentState.push<dynamic>(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: args),
      ),
    );
  }

  void pushReplacement<T extends Widget, N>({@required T page, N args}) {
    key.currentState.pushReplacement(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: args),
      ),
    );
  }

  /// 全ての履歴を削除し、新たなページへ遷移する
  void pushAndAllClear<T extends Widget, N>({@required T page, N args}) {
    key.currentState.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => page,
        settings: RouteSettings(arguments: args),
      ),
      (_) => false,
    );
  }

  void pop() {
    key.currentState.pop();
  }
}
