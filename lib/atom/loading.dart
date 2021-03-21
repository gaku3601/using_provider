import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingController with ChangeNotifier {
  bool _isLoading = false;

  set __isLoading(bool flg) {
    this._isLoading = flg;
    notifyListeners();
  }

  Future<T> loading<T>(Future<T> Function() process) async {
    this.__isLoading = true;
    try {
      final response = await process();
      return response;
    } catch (e) {
      throw e;
    } finally {
      this.__isLoading = false;
    }
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
