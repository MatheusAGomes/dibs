import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleService {
  final Color? batchColor;
  final List<Shadow>? categoryShadow;

  TextStyleService({this.batchColor, this.categoryShadow});

  static TextStyle bottomNavigationBar = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: -0.41,
  ));

  static TextStyle defaultTextField = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500, letterSpacing: -0.41, fontSize: 12));

  static TextStyle defaultFieldLabel = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500, letterSpacing: -0.41, fontSize: 14));

  static TextStyle defaultSignIn = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: -0.41,
          fontSize: 17,
          height: 1));

  static TextStyle greenSignIn = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: -0.41,
          fontSize: 17,
          height: 1,
          color: Color(0xFF198A68),
          decoration: TextDecoration.underline));

  static TextStyle labelSubtitle = GoogleFonts.jost(
      textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      letterSpacing: -0.41,
      fontSize: 15,
  ));

  static TextStyle appBar = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    fontSize: 17,
  ));

  static TextStyle defaultButton = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.41,
          fontSize: 16,
          color: Color(0xFFFFFFFF),
          shadows: <Shadow>[
        Shadow(offset: Offset(2, 2), color: Color(0x1A000000), blurRadius: 1)
      ]));

  static TextStyle corSublinhadaSignIn = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 50,
          color: Color(0xFF000000),
          letterSpacing: -1.41,
          height: 1,
          shadows: <Shadow>[
        Shadow(
            offset: Offset(1.5, 1.5),
            color: Color.fromRGBO(126, 244, 209, 0.72))
      ]));

  static TextStyle mediumSpacing141 = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: -1.41,
    height: 1,
    color: Color(0xFF000000),
  ));

  TextStyle get corSublinhada {
    return GoogleFonts.jost(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        letterSpacing: -1.41,
        shadows: categoryShadow,
      ),);
  }

  static TextStyle regularTitle = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: -1.41,
  ));

  static TextStyle ticketBannerTitle = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: -0.61,
  ));

  static TextStyle ticketBannerDateTime = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          letterSpacing: -1.5,
          height: 0.2));

  TextStyle get ticketBannerBatch {
    return GoogleFonts.jost(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: -1.0,
        height: 1.3,
        color: batchColor,
      ),
    );
  }

    static TextStyle ticketBannerType = GoogleFonts.jost(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            letterSpacing: 0,
            height: 1.3,
            color: Color(0x8A000000)));

    static TextStyle toggleSwitchActiveText = GoogleFonts.inter(
        textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11,
            letterSpacing: -0.08,
            color: Color.fromRGBO(0, 0, 0, 1)));

    static TextStyle toggleSwitchInactiveText = GoogleFonts.inter(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 11,
          letterSpacing: -0.08,
        ));

    static TextStyle iconButtonText = GoogleFonts.jost(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          letterSpacing: -1.08,
        ));
}
