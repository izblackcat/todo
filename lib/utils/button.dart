import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final Icon icon;
  final VoidCallback onPressedFunction;

  const Button(
      {super.key,
      required this.color,
      required this.onPressedFunction,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      highlightElevation: 0.0,
      shape: const CircleBorder(),
      onPressed: onPressedFunction,
      backgroundColor: color,
      child: icon,
    );
  }
}
