import 'package:flutter/material.dart';

class BottomSheetContent extends StatelessWidget {
  final int index;
  final int number;
  final String type;
  final Function(int) onItemSelected;

  const BottomSheetContent({
    super.key,
    required this.index,
    required this.number,
    required this.type,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> filteredItems = List.generate(10, (i) => i)
        .where((n) =>
            (type == 'circle' && n % 3 == 0) ||
            (type == 'square' && n % 2 == 0) ||
            (type == 'cross' && n % 2 != 0))
        .toList();

    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text('Number: ${filteredItems[i]}'),
          onTap: () {
            Navigator.pop(context);
            onItemSelected(index);
          },
        );
      },
    );
  }
}
