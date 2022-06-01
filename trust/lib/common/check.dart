import 'package:flutter/material.dart';

class Check {
  emailValidator() =>
      (String? value) => value!.isEmpty ? "enter an email" : null;

  passwordValidator() => (String? value) =>
      value!.length < 6 ? "enter a password with at least 6 characters" : null;
}
