// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_scroll_widget/Screen/fibonacci_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_scroll_widget/controller/fibonacci_controller.dart';

void main() {
  testWidgets('List item highlights when tapped', (WidgetTester tester) async {
    final controller = FibonacciController();
    controller.getFibonacciNumbersWithType(41);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: FibonacciView(),
      ),
    ));

    await tester.pumpAndSettle();

    // ค้นหา widget ที่มีข้อความ 'Index: 0, Number: 0'
    final textFinder = find.text('Index: 0, Number: 0');
    expect(textFinder, findsOneWidget);

    // หา ancestor ที่เป็น ListTile
    final listTileFinder = find.ancestor(
      of: textFinder,
      matching: find.byType(ListTile),
    );
    expect(listTileFinder, findsOneWidget);

    await tester.tap(listTileFinder);
    await tester.pump();

    // ตรวจสอบว่าไฮไลต์ถูกต้อง
    final listTile = tester.widget<ListTile>(listTileFinder);
    expect(listTile.tileColor, Colors.red);
  });
}
