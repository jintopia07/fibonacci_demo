import '../Model/fibonacci_model.dart';

class FibonacciController {
  List<Map<String, dynamic>> _fibonacciList = [];

  // Fetch Fibonacci numbers with types from FibonacciModel
  List<Map<String, dynamic>> getFibonacciNumbersWithType(int count) {
    if (_fibonacciList.isEmpty) {
      FibonacciModel fibonacciModel = FibonacciModel(0, 0, '');
      _fibonacciList = fibonacciModel.generateFibonacci(count);
    }
    return _fibonacciList;
  }

  // Update the indexes in the Fibonacci list (start from 1)
  void updateIndexes() {
    for (int i = 0; i < _fibonacciList.length; i++) {
      _fibonacciList[i]['index'] = i + 1; // Start index from 1 instead of 0
    }
  }

  void removeItemAtIndex(int index) {
    // ตรวจสอบว่า index อยู่ในขอบเขตของ list หรือไม่
    if (index >= 0 && index < _fibonacciList.length) {
      _fibonacciList.removeAt(index); // ลบไอเทมที่ตำแหน่ง index
    } else {
      print("No item found with index: $index");
    }
  }

  // Getter for the Fibonacci list
  List<Map<String, dynamic>> get fibonacciList => _fibonacciList;
}
