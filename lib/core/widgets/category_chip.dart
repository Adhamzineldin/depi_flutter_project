import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }
}