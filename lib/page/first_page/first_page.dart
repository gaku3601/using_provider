import 'package:flutter/material.dart';
import 'package:using_provider/atom/base.dart';
import 'package:using_provider/atom/button.dart';
import 'package:using_provider/page/first_page/first_page_controller.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base<FirstPageController>(
      notifier: (locator) => FirstPageController(locator: locator),
      body: (context, read, select) {
        return Column(
          children: [
            Text(select((controller) => controller.count).toString()),
            Button(
              'count',
              onPressed: () {
                read.increment();
              },
            ),
            Text(select((controller) => controller.count2).toString()),
            Button(
              'count',
              onPressed: () {
                read.increment2();
              },
            ),
            Button(
              'loading',
              onPressed: () async {
                await read.loading();
              },
            ),
            Button(
              'snackbar',
              onPressed: () {
                read.onSnack();
              },
            ),
            Button(
              '遷移',
              onPressed: () {
                read.move();
              },
            ),
          ],
        );
      },
    );
  }
}
