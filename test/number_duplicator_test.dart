import 'package:aparkado_interview/streams/number_duplicator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should duplicate number', () {
    final myUTS = NumberDuplicator();
    myUTS.output.listen((number) {
      expect(number, 10);
    });
    myUTS.addNumber(5);
  });
}
