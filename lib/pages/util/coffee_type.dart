// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final VoidCallback onTap;
  final bool isSelected;

  CoffeeType(
      {required this.coffeeType,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeeType,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.white),
        ),
      ),
    );
  }
}
