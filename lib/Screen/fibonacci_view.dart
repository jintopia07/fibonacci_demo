// ignore_for_file: unused_field, unused_local_variable, dead_code

import 'package:flutter/material.dart';
import '../controller/fibonacci_controller.dart';
import '../widget/icon.dart';

class FibonacciView extends StatefulWidget {
  const FibonacciView({super.key});

  @override
  State<FibonacciView> createState() => _FibonacciViewState();
}

class _FibonacciViewState extends State<FibonacciView> {
  final FibonacciController _controller = FibonacciController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> _fibonacciList = [];
  final List<Map<String, dynamic>> _bottomSheetItems = [];
  String? _lastSelectedType;
  int? _highlightedIndex;
  Map<String, dynamic>? _selectedItem;
  final Map<int, GlobalObjectKey> _keys = {};

  @override
  void initState() {
    super.initState();

    _fibonacciList = _controller.getFibonacciNumbersWithType(41);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Example Demo')),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        itemCount: _fibonacciList.length,
        itemBuilder: (context, index) {
          final item = _fibonacciList[index];
          final number = item['number'];
          final type = item['type'];
          final isHighlighted = index == _highlightedIndex;

          return ListTile(
            title: Text('Index: ${item['index']}, Number: ${item['number']}'),
            trailing: getIconForType(item['type']),
            tileColor: isHighlighted ? Colors.red : null,
            onTap: () {
              setState(() {
                _highlightedIndex = index;
                print("Highlighted Index: $_highlightedIndex"); // เพิ่มการดีบัก
              });
              _showBottomSheet(context, index, item);
            },
          );
        },
      ),
    );
  }

  void moveItemBackToMainList(Map<String, dynamic> item) {
    int insertIndex = _fibonacciList
        .indexWhere((element) => element['index'] > item['index']);

    if (insertIndex == -1) {
      _fibonacciList.add(item);
    } else {
      _fibonacciList.insert(insertIndex, item);
    }

    setState(() {
      _highlightedIndex = insertIndex;
    });

    if (_scrollController.hasClients) {
      double itemPosition = _getItemPosition(insertIndex);
      _scrollController.animateTo(
        itemPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  double _getItemPosition(int index) {
    const double itemHeight = 70.0; // ความสูงเฉลี่ยของแต่ละ ListTile
    const int targetPositionOnScreen = 3; // ต้องการให้แสดงในลำดับที่ 3 ของจอ
    double offsetToTarget = itemHeight * (targetPositionOnScreen - 1);

    double targetPosition = (itemHeight * index) - offsetToTarget;
    targetPosition = targetPosition.clamp(
      _scrollController.position.minScrollExtent,
      _scrollController.position.maxScrollExtent,
    );

    return targetPosition;
  }

  void _showBottomSheet(
      BuildContext context, int index, Map<String, dynamic> tappedItem) {
    final selectedType = tappedItem['type'];

    if (_lastSelectedType != null && _lastSelectedType != selectedType) {
      setState(() {
        _bottomSheetItems.clear();
      });
    }

    final selectItems = _bottomSheetItems
        .where((item) => item['type'] == selectedType)
        .toList();

    _lastSelectedType = selectedType;

    bool isselectedTab = false;
    bool isaddselectedType = true;

    if (isaddselectedType = true) {
      isselectedTab = false;
    } else {
      isselectedTab = true;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        selectItems.sort((a, b) => a['index'].compareTo(b['index']));
        return ListView(
          children: [
            ...selectItems.map((item) {
              return InkWell(
                onTap: () {
                  setState(() {
                    isaddselectedType = false;

                    _bottomSheetItems.remove(item);

                    moveItemBackToMainList(item);
                  });

                  Navigator.pop(context);

                  Future.delayed(const Duration(milliseconds: 200), () {
                    if (_scrollController.hasClients) {
                      int insertIndex = _fibonacciList.indexOf(item);
                      double itemPosition = _getItemPosition(
                          insertIndex); // คำนวณตำแหน่งของรายการ
                      _scrollController.animateTo(
                        itemPosition,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  });
                },
                child: ListTile(
                  title: Text('Number: ${item['number']}'),
                  subtitle: Text('Index: ${item['index']}'),
                  trailing: getIconForType(item['type']),
                  tileColor: isselectedTab ? Colors.green : Colors.transparent,
                ),
              );
            }),
            ListTile(
              title: Text('Number: ${tappedItem['number']}'),
              subtitle: Text('Index: ${tappedItem['index']}'),
              trailing: getIconForType(tappedItem['type']),
              tileColor: isaddselectedType ? Colors.green : Colors.transparent,
              onTap: () {
                setState(() {
                  _bottomSheetItems.add(tappedItem);
                  _fibonacciList.removeAt(index);
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
