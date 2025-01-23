// Main entry point for the Flutter application
// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_scroll_widget/Screen/fibonacci_view.dart';

void main() {
  runApp(const FibonacciApp());
}

class FibonacciApp extends StatelessWidget {
  const FibonacciApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FibonacciView(),
    );
  }
}
