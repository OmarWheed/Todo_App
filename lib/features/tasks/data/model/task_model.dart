import 'package:flutter/material.dart';

class TaskModel {
  final int id;
  final String title;
  final String note;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool isCompleted;
  final String data;
  final int color;

  TaskModel({
    required this.id,
    required this.title,
    required this.note,
    required this.data,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });
}
