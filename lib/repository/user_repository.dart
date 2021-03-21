class UserRepository {
  Future<String> fetchName() async {
    await new Future.delayed(new Duration(seconds: 3));
    return 'username';
  }

  Future<String> fetchProfile() async {
    await new Future.delayed(new Duration(seconds: 3));
    // ここで例外を発生させる
    throw Exception('can not fetch profile');
  }
}
