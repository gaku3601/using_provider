import 'package:flutter/material.dart';
import 'package:using_provider/atom/base.dart';
import 'package:using_provider/atom/button.dart';
import 'package:using_provider/page/error_page/error_page_controller.dart';
import 'package:using_provider/page/first_page/first_page.dart';
import 'package:using_provider/util/navigate.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base(
      notifier: (locator) => ErrorPageController(locator: locator),
      body: (context, read, select) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('errorが発生しました！'),
              Text('初回ページに遷移してください!'),
              Button(
                '最初のページへ戻る',
                onPressed: () => Navigate.pushReplacement(page: FirstPage()),
              )
            ],
          ),
        );
      },
    );
  }
}
