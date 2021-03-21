import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Base<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(
      BuildContext, T, dynamic Function(dynamic Function(T)) select) body;
  final T Function(T Function<T>() locator) notifier;

  Base({this.body, this.notifier});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<T>(
            create: (context) => this.notifier(context.read)),
      ],
      builder: (context, _) {
        final read = context.read<T>();
        final select = (selector(T controller)) =>
            context.select((T controller) => selector(controller));
        return GestureDetector(
          onTap: () {
            // カーソルをはずす処理
            final FocusScopeNode currentScope = FocusScope.of(context);
            if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: this.body(context, read, select),
            ),
          ),
        );
      },
    );
  }
}
