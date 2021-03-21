import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Base<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(
      BuildContext, T, dynamic Function(dynamic Function(T)) select) body;
  final ChangeNotifier notifier;

  Base({this.body, this.notifier});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => this.notifier,
      child: Builder(
        builder: (newContext) {
          final read = newContext.read<T>();
          final select = (selector(T controller)) =>
              newContext.select((T controller) => selector(controller));
          return GestureDetector(
            onTap: () {
              // カーソルをはずす処理
              final FocusScopeNode currentScope = FocusScope.of(newContext);
              if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            },
            child: Scaffold(
              body: SafeArea(
                child: this.body(newContext, read, select),
              ),
            ),
          );
        },
      ),
    );
  }
}
