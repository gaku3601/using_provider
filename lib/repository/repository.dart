import 'package:provider/provider.dart';
import 'package:using_provider/repository/user_repository.dart';

class Repository {
  static List<Provider> providers() {
    return [
      Provider<UserRepository>(create: (_) => UserRepository()),
    ];
  }
}
