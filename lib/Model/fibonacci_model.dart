class FibonacciModel {
  final int index;
  final int number;
  final String type;

  FibonacciModel(this.index, this.number, this.type);

  List<Map<String, dynamic>> generateFibonacci(int count) {
    List<Map<String, dynamic>> fibList = [];
    int a = 0, b = 1;

    for (int i = 0; i < count; i++) {
      int currentNumber = a;
      String type = _getTypeForNumber(currentNumber);

      fibList.add({
        'index': i,
        'number': currentNumber,
        'type': type,
      });

      int next = a + b;
      a = b;
      b = next;
    }

    return fibList;
  }

  // Determine type based on the Fibonacci number
  String _getTypeForNumber(int number) {
    if (number == 0) return 'circle';
    if (number == 1) return 'square';
    if (number == 2) return 'cross';
    if (number == 3) return 'circle';
    if (number == 5) return 'cross';
    if (number == 8) return 'cross';
    if (number == 13) return 'square';
    if (number == 21) return 'circle';
    if (number == 34) return 'square';
    if (number == 55) return 'square';
    if (number == 89) return 'cross';
    if (number == 144) return 'circle';
    if (number == 233) return 'cross';
    if (number == 377) return 'cross';
    if (number == 610) return 'square';
    if (number == 987) return 'circle';
    if (number == 1597) return 'square';
    if (number == 2584) return 'square';
    if (number == 4181) return 'cross';
    if (number == 6765) return 'circle';
    if (number == 10946) return 'cross';
    if (number == 17711) return 'cross';
    if (number == 28657) return 'square';
    if (number == 46368) return 'circle';
    if (number == 75025) return 'square';
    if (number == 121393) return 'square';
    if (number == 196418) return 'cross';
    if (number == 317811) return 'circle';
    if (number == 514229) return 'cross';
    if (number == 832040) return 'cross';
    if (number == 1346269) return 'square';
    if (number == 2178309) return 'circle';
    if (number == 3524578) return 'square';
    if (number == 5702887) return 'square';
    if (number == 9227465) return 'cross';
    if (number == 14930352) return 'circle';
    if (number == 24157817) return 'cross';
    if (number == 39088169) return 'cross';
    if (number == 63245986) return 'square';
    if (number == 102334155) return 'circle';

    // Default type if no specific rule matches
    return 'unknown';
  }

  List<Map<String, dynamic>> generateFibonacciSequence(int count) {
    List<Map<String, dynamic>> fibonacciList = [];
    List<String> types = [
      'circle',
      'square',
      'square',
      'cross',
      'circle',
      'cross'
    ];

    int a = 0, b = 1;
    for (int i = 0; i < count; i++) {
      fibonacciList.add({
        'index': i,
        'number': a,
        'type': types[i % types.length], // Cycling through the types list
      });
      int next = a + b;
      a = b;
      b = next;
    }
    return fibonacciList;
  }
}
