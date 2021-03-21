class UserRepository {
  Future<String> fetchName() async {
    await new Future.delayed(new Duration(seconds: 3));
    return 'username';
  }
}
