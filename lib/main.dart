import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/loading.dart';
import 'package:using_provider/util/navigate.dart';
import 'package:using_provider/util/snack_message.dart';
import 'package:using_provider/page/first_page/first_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingController>(
            create: (_) => LoadingController()),
        Provider<SnackMessage>(
          create: (_) => SnackMessage(),
        ),
        Provider<Navigate>(
          create: (_) => Navigate(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: context.read<Navigate>().key,
      scaffoldMessengerKey: context.read<SnackMessage>().scaffoldMessengerState,
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
