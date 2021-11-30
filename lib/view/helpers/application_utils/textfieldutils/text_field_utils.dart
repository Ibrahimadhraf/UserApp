import 'package:flutter/material.dart';

class TextFieldUtils {
  TextFieldUtils._internal();

  static final TextFieldUtils _instance = TextFieldUtils._internal();

  factory TextFieldUtils() => _instance;

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
