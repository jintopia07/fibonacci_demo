import 'package:flutter/material.dart';

Widget getIconForType(String type) {
  switch (type) {
    case 'circle':
      return const Icon(Icons.circle, color: Colors.black);
    case 'square':
      return const Icon(Icons.stop_outlined, color: Colors.black);
    case 'cross':
      return const Icon(Icons.close, color: Colors.black);
    default:
      return const Icon(Icons.help);
  }
}
