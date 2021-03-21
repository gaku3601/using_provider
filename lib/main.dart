import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/loading.dart';
import 'package:using_provider/page/error_page/error_page.dart';
import 'package:using_provider/page/first_page/first_page.dart';
import 'package:using_provider/repository/repository.dart';
import 'package:using_provider/util/navigate.dart';
import 'package:using_provider/util/snack_message.dart';

Future main() async {
  await run();
}

Future run() async {
  await runZonedGuarded<Future<void>>(
    () async {
      //起動前処理
      WidgetsFlutterBinding.ensureInitialized();
      // 画面を縦に固定
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      // flutter sdkのerrorを補足
      FlutterError.onError = (FlutterErrorDetails details) async {
        Zone.current.handleUncaughtError(details.exception, details.stack);
      };

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LoadingController>(
                create: (_) => LoadingController()),
            ...Repository.providers(),
          ],
          child: MyApp(),
        ),
      );
    },
    // dartのerrorを補足
    // 詳細は以下
    // https://github.com/flutter/flutter/issues/48972
    (error, stack) {
      Navigate.pushAndAllClear(page: ErrorPage());
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Navigate.key,
      scaffoldMessengerKey: SnackMessage.scaffoldMessengerState,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return Loading(child);
      },
      home: FirstPage(),
    );
  }
}
