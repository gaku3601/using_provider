import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Base<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(
      BuildContext,
      T,
      Selector<T, Object> Function(Object Function(T), Widget Function(Object))
          select) body;
  final ChangeNotifier notifier;

  Base({this.body, this.notifier});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => this.notifier,
      child: Builder(
        builder: (newContext) {
          final read = newContext.read<T>();
          final select =
              (Object property(T model), Widget widget(Object value)) =>
                  Selector(
                    selector: (context, T model) => property(model),
                    builder: (context, value, child) => widget(value),
                  );
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
