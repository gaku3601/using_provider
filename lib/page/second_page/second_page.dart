import 'package:flutter/material.dart';
import 'package:using_provider/atom/base.dart';
import 'package:using_provider/atom/button.dart';
import 'package:using_provider/page/first_page/first_page.dart';
import 'package:using_provider/page/second_page/second_page_controller.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base<SecondPageController>(
      notifier: SecondPageController(),
      body: (context, read, select) {
        return Column(
          children: [
            Button(
              '遷移',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstPage();
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
