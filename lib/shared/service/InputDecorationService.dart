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
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: ColorService.cinza),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: ColorService.cinza),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 1, color: ColorService.azul),
      ),
    );
  }
}
