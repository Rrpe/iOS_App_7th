import 'package:test_example/test_dart_sample.dart';
import 'package:test/test.dart';

import '../test_dart_sample.dart';

void main() {
  test('Travel Distance', () {
    var distance = 10.0;
    var expectedDistance = distance;

    var travel = Travel(distance);
    var result = travel.distance;

    expect(result, expectedDistance);
  });
}
