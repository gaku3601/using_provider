import 'package:flutter/material.dart';
import 'package:using_provider/atom/base.dart';
import 'package:using_provider/atom/button.dart';
import 'package:using_provider/atom/input_text.dart';
import 'package:using_provider/page/second_page/second_page_controller.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base<SecondPageController>(
      notifier: (locator) => SecondPageController(locator: locator)..init(),
      body: (context, read, select) {
        return Column(
          children: [
            Text('output1:'),
            Text(select((controller) => controller.text1)),
            Text('output2:'),
            Text(select((controller) => controller.text2)),
            SizedBox(height: 10),
            InputText(
              controller: read.inputTextController1,
              label: 'input1',
              placeholder: '入力してね',
            ),
            InputText(
              controller: read.inputTextController2,
              label: 'input2',
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
              'loading',
              onPressed: () async {
                await read.loading();
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
