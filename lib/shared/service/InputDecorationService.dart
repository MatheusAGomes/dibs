import 'package:flutter/material.dart';

import '../routes/routes.dart';
import 'colorService.dart';

class InputDecorationService {
  final Widget? prefixIcon;
  final String? hint;

  InputDecorationService({this.prefixIcon, this.hint});

  InputDecoration get inputPadrao {
    return InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon,
      prefixIconColor: Colors.grey,
      contentPadding: EdgeInsets.symmetric(
        horizontal:
            MediaQuery.of(Routes.navigatorKey.currentContext!).size.width *
                0.03,
        vertical: 0,
      ),
      hintStyle: TextStyle(color: ColorService.cinza),
      // border: InputBorder.none,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(width: 1, color: Color(0x33000000)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(width: 2, color: Color(0xFFFF3636)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(width: 2, color: Color(0xFFFF3636)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(width: 1, color: Color(0x33000000)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(width: 1, color: Color(0x80000000)),
      ),
    );
  }
}
