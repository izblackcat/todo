// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo/utils/button.dart';
import 'package:todo/utils/colors.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: fourthColor,
      content: Container(
        height: 310,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              maxLength: 300,
              maxLines: 8,
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "What to do next?"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                    color: secondColor,
                    icon: Icon(Icons.check_outlined),
                    onPressedFunction: onSave),
                Button(
                    color: thirdColor,
                    icon: Icon(Icons.close_outlined),
                    onPressedFunction: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
