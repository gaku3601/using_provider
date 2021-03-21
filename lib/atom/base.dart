import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/loading.dart';

abstract class BaseNotifier with ChangeNotifier {
  final LoadingController loadingController = LoadingController();
}

class SnackBarController with ChangeNotifier {
  final Locator locator;

  SnackBarController({@required this.locator});

  void onSnackbar() {
    ScaffoldMessenger.of(this.locator())
        .showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
  }
}

class Base<T extends BaseNotifier> extends StatelessWidget {
  final Widget Function(
      BuildContext, T, dynamic Function(dynamic Function(T)) select) body;
  final BaseNotifier notifier;

  Base({this.body, this.notifier});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<T>(create: (_) => this.notifier),
        ChangeNotifierProvider<LoadingController>(
            create: (_) => this.notifier.loadingController),
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
              child: Loading(this.body(context, read, select)),
            ),
          ),
        );
      },
    );
  }
}
