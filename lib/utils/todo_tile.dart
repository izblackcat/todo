// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/utils/colors.dart';

class TodoTile extends StatelessWidget {
  final String todoTitle;
  final bool todoStatus;

  Function(bool?)? onChanged;
  VoidCallback onDeleted;

  TodoTile(
      {super.key,
      required this.todoTitle,
      required this.todoStatus,
      required this.onChanged,
      required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: Container(
          padding: EdgeInsets.only(top: 24, bottom: 24, left: 10, right: 10),
          decoration: BoxDecoration(
              color: thirdColor, borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Distributes children evenly
            children: [
              // Group the Checkbox and Text together in a Row
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      value: todoStatus,
                      onChanged: onChanged,
                      activeColor: mainColor,
                    ),
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.visible,
                        todoTitle,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 21,
                          color: mainColor,
                          decoration: todoStatus
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Place the IconButton directly in the parent Row
              IconButton(
                onPressed: onDeleted,
                icon: Icon(
                  Icons.delete,
                  color: mainColor,
                ),
              ),
            ],
          )),
    );
  }
}
