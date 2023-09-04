import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleService {
  static TextStyle corSublinhada = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          letterSpacing: -1.41,
          shadows: <Shadow>[
        Shadow(
            offset: Offset(1.5, 1.5),
            color: Color.fromRGBO(126, 244, 209, 0.72))
      ]));
}
