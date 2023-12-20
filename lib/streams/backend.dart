class Backend {
  Future<int> getDouble(int number) async {
    await Future.delayed(const Duration(seconds: 1));
    return number * 2;
  }
}
