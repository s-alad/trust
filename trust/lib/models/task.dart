import 'package:flutter/material.dart';

class Task {
  final String? name;
  final String? text;

  Task({this.name, this.text});

  Map<String, dynamic> toJson() => {
        'name': name,
        'text': text,
      };
}
