import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colorService.dart';

class ToastService {
  static showToast(msg, textColor, backgroundColor) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        textColor: textColor,
        backgroundColor: backgroundColor,
        fontSize: 16.0);
  }

  static showToastError(String msg) {
    showToast(msg, Colors.white, Colors.red);
  }

  static showToastInfo(String msg) {
    showToast(msg, Colors.white, Color(0xFF198A68));
  }

  static showToastWarning(String msg) {
    showToast(msg, Colors.white, ColorService.warning);
  }
}
