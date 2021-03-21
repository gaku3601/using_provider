import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputTextController with ChangeNotifier {
  // state
  String _text = '';
  String _error;
  TextEditingController _textEditingController;

  // getter
  String get text => this._text;

  // setter
  set __text(String text) {
    this._text = text;
    this._onChanged(this._text);
    if (this._isAutoValidation) {
      this.onValidation();
    }
  }

  set __error(String text) {
    this._error = text;
    notifyListeners();
  }

  set __textEditingController(String text) {
    this._textEditingController = TextEditingController(text: text);
    this._textEditingController.selection =
        TextSelection.collapsed(offset: text.length);
    notifyListeners();
  }

  // prop
  final bool _isAutoValidation;
  final String Function(String text) _validator;
  final Function(String text) _onChanged;

  InputTextController(
      {isAutoValidation = true,
      String Function(String text) validator,
      Function(String text) onChanged})
      : this._isAutoValidation = isAutoValidation,
        this._validator = validator ?? ((String value) => null),
        this._onChanged = onChanged ?? ((String value) {});

  // バリデーション処理
  bool onValidation() {
    this.__error = this._validator(this._text);
    return this._error != null;
  }

  // textFieldに文字をセットします
  void setField(String text) {
    this.__text = text;
    this.__textEditingController = text;
  }
}

class InputText extends StatelessWidget {
  final String label;
  final String placeholder;
  final ChangeNotifier controller;

  InputText({this.label, this.placeholder, ChangeNotifier controller})
      : this.controller = controller ?? InputTextController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InputTextController>(
      create: (_) => this.controller,
      child: Builder(
        builder: (newContext) {
          final read = newContext.read<InputTextController>();
          final select = (selector(InputTextController controller)) =>
              newContext.select(
                  (InputTextController controller) => selector(controller));
          return TextField(
            controller:
                select((controller) => controller._textEditingController),
            onChanged: (String text) {
              read.__text = text;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: this.label,
              hintText: this.placeholder,
              errorText: select((controller) => controller._error),
            ),
          );
        },
      ),
    );
  }
}
