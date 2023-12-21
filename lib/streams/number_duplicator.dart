import 'dart:async';

import 'package:aparkado_interview/streams/backend.dart';

class NumberDuplicator {
  final _input = StreamController<int>()
    ..stream.listen((number) async {
      final doubledNumber = await Backend().getDouble(number);
      _output.add(doubledNumber);
    });

  Stream<int> get output => _output.stream;
  static final _output = StreamController<int>();

  void addNumber(int number) => _input.add(number);
}
