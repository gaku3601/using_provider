import 'package:using_provider/atom/base.dart';

class FirstPageController extends BaseNotifier {
  int _count = 0;
  int _count2 = 0;

  // getter
  int get count => this._count;

  int get count2 => this._count2;

  // setter
  set __count(int count) {
    this._count = count;
    notifyListeners();
  }

  set __count2(int count) {
    this._count2 = count;
    notifyListeners();
  }

  Future loading() async {
    this.loadingController.startLoading();
    await new Future.delayed(new Duration(seconds: 3));
    this.loadingController.endLoading();
  }

  void increment() {
    this.__count = this._count + 1;
  }

  void increment2() {
    this.__count2 = this._count2 + 1;
  }
}
