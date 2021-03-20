import 'package:flutter/material.dart';
import 'package:using_provider/atom/base.dart';
import 'package:using_provider/atom/button.dart';
import 'package:using_provider/page/first_page_controller.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base<FirstPageController>(
      notifier: FirstPageController(),
      body: (context, read, select) {
        return Column(
          children: [
            select((model) => model.count, (value) => Text(value.toString())),
            Button(
              'count',
              onPressed: () {
                read.increment();
              },
            ),
            select((model) => model.count2, (value) => Text(value.toString())),
            Button(
              'count',
              onPressed: () {
                read.increment2();
              },
            ),
          ],
        );
      },
    );
  }
}
