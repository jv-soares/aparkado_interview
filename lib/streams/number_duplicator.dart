import 'dart:async';

class NumberDuplicator {
  final _input = StreamController<int>();

  Stream<int> get output => _output.stream;
  final _output = StreamController<int>();

  void addNumber(int number) => _input.add(number);
}
