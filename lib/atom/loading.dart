import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingController with ChangeNotifier {
  bool _isLoading = false;

  set __isLoading(bool flg) {
    this._isLoading = flg;
    notifyListeners();
  }

  void startLoading() {
    this.__isLoading = true;
  }

  void endLoading() {
    this.__isLoading = false;
  }
}

class Loading extends StatelessWidget {
  final Widget child;

  Loading(this.child);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        this.child,
        if (context
            .select((LoadingController controller) => controller._isLoading))
          Stack(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
      ],
    );
  }
}
