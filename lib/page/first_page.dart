import 'package:flutter/material.dart';
import 'package:using_provider/atom/base.dart';
import 'package:using_provider/atom/button.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Base(
      body: Column(
        children: [
          Text('0'),
          Button(
            'count',
            onPressed: () {
              print('tap');
            },
          )
        ],
      ),
    );
  }
}
