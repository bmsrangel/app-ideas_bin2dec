import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static final RegExp _notOneOrZero = RegExp(r'[^01]');

  static bool isInputValid(String input) {
    return !_notOneOrZero.hasMatch(input);
  }

  static String validateInput(String input) {
    if (!isInputValid(input)) {
      return "Invalid input. Must contain only 0 and/or 1";
    } else {
      return null;
    }
  }

  static void showErrorMessage({
    GlobalKey<ScaffoldState> scaffoldKey,
    String message,
    Color backgroundColor = Colors.red,
  }) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
