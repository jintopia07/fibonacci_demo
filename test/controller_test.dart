import 'package:flutter_scroll_widget/controller/fibonacci_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FibonacciController Tests', () {
    late FibonacciController controller;

    setUp(() {
      controller = FibonacciController();
    });

    test('Should return correct Fibonacci sequence with type', () {
      final result = controller.getFibonacciNumbersWithType(5);

      expect(result, [
        {'index': 0, 'number': 0, 'type': 'circle'},
        {'index': 1, 'number': 1, 'type': 'square'},
        {'index': 2, 'number': 1, 'type': 'square'},
        {'index': 3, 'number': 2, 'type': 'cross'},
        {'index': 4, 'number': 3, 'type': 'circle'},
      ]);
    });

    test('Should handle zero count input', () {
      final result = controller.getFibonacciNumbersWithType(0);

      expect(result, []);
    });

    test('Should handle negative count input', () {
      final result = controller.getFibonacciNumbersWithType(-1);

      expect(result, []);
    });
  });
}
