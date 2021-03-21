import 'package:flutter/material.dart';
import 'package:using_provider/atom/base.dart';
import 'package:using_provider/atom/button.dart';
import 'package:using_provider/atom/input_text.dart';
import 'package:using_provider/page/first_page/first_page.dart';
import 'package:using_provider/page/second_page/second_page_controller.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base<SecondPageController>(
      notifier: (locator) => SecondPageController(locator: locator)..init(),
      body: (context, read, select) {
        return Column(
          children: [
            Text('output:'),
            Text(select((controller) => controller.text)),
            SizedBox(height: 10),
            InputText(
              controller: read.inputTextController,
              label: 'input',
              placeholder: '入力してね',
            ),
            Button(
              '値を登録',
              onPressed: () {
                read.register();
              },
            ),
            Button(
              'reset',
              onPressed: () {
                read.textReset();
              },
            ),
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
