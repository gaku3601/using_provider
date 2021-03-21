import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/atom/snack_bar.dart';
import 'package:using_provider/page/first_page/first_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SnackBarController>(
          create: (_) => SnackBarController(),
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
      scaffoldMessengerKey:
          context.read<SnackBarController>().scaffoldMessengerState,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
