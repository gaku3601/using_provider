import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onPressed;

  Button(this.label, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode()); // フォーカスをはずす
        this.onPressed();
      },
      child: Text(this.label),
    );
  }
}
