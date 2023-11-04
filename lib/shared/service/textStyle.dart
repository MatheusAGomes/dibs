import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleService {
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final List<Shadow>? categoryShadow;

  TextStyleService(
      {this.color,
      this.categoryShadow,
      this.fontSize,
      this.letterSpacing});

  static TextStyle bottomNavigationBar = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    letterSpacing: -0.41,
  ));

  static TextStyle ticketBannerType = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          letterSpacing: 0,
          height: 1.3,
          color: Color(0x8A000000)));

  static TextStyle toggleSwitchInactiveText = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    letterSpacing: -0.08,
  ));

  static TextStyle eventLocalCategory = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13,
          letterSpacing: -0.08,
          height: 1.3,
          color: Color(0x8A000000)));

  TextStyle get defaultTextField {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.w500, letterSpacing: -0.41, fontSize: 13,
            color: color));
  }

  static TextStyle mediumSpacing041 = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500, letterSpacing: -0.41, fontSize: 11,
          color: Color(0xFF909090)));

  static TextStyle defaultFieldLabel = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500, letterSpacing: -0.41, fontSize: 13));

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

  TextStyle get medium {
    return GoogleFonts.jost(
        textStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize!,
      letterSpacing: letterSpacing!,
      height: 1,
      color: const Color(0xFF000000),
    ));
  }

  static TextStyle companyBatch = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          letterSpacing: -0.41,
          height: 0.7,
          color: Color(0xFF6A6A6A))
  );

  TextStyle get companyBatchType {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            letterSpacing: -0.41,
            color: color!)
    );
  }

  static TextStyle ticketInput = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          letterSpacing: -0.41)
  );

  static TextStyle announcedTickets = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: -0.91,
          height: 1.3,
          color: Colors.grey));

  static TextStyle ticketPrice = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          letterSpacing: -0.91,
          height: 1.2,
          color: Colors.grey));

  static TextStyle eventLocal = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: -0.41,
          height: 1.3,
          color: Color(0x8A000000)));

  static TextStyle ticketBannerDateTime = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          letterSpacing: -1.5,
          height: 0.2));

  TextStyle get eventDateTime {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize,
            letterSpacing: -1.5,
            height: 0.2));
  }

  TextStyle get ticketBannerBatch {
    return GoogleFonts.jost(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        letterSpacing: -1.0,
        height: 1.3,
        color: color!,
      ),
    );
  }

  static TextStyle toggleSwitchActiveText = GoogleFonts.inter(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 11,
          letterSpacing: -0.08,
          color: Color.fromRGBO(0, 0, 0, 1)));

  static TextStyle labelSubtitle = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    fontSize: 14,
  ));

TextStyle get creditCardComponent {
  return GoogleFonts.jost(
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.41,
        fontSize: fontSize,
        color: color,
        height: 1.1
      ));
}

  static TextStyle appBar = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    letterSpacing: -0.41,
    fontSize: 17,
  ));

  static TextStyle ticketBannerTitle = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: -0.61,
  ));

  TextStyle get iconButtonText {
    return GoogleFonts.jost(
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          letterSpacing: -1.08,
        ));
  }

  static TextStyle eventBatch = GoogleFonts.jost(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        letterSpacing: -0.91,
        height: 2
      ));

  static TextStyle companyBatchStatus = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          letterSpacing: -0.91,
      ));

  TextStyle get companyBatchAmount {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: -1.41,
            color: color!)
    );
  }

  static TextStyle defaultButton = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.41,
          fontSize: 16,
          color: Color(0xFFFFFFFF),
          shadows: <Shadow>[
        Shadow(offset: Offset(2, 2), color: Color(0x1A000000), blurRadius: 1)
      ]));

  TextStyle get corSublinhadaSignIn {
    return GoogleFonts.jost(
        textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: fontSize,
            color: Color(0xFF000000),
            letterSpacing: -1.41,
            height: 1,
            shadows: <Shadow>[
          Shadow(
              offset: Offset(1.5, 1.5),
              color: Color.fromRGBO(126, 244, 209, 0.72))
        ]));
  }

  TextStyle get corSublinhada {
    return GoogleFonts.jost(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        letterSpacing: -1.41,
        shadows: categoryShadow!,
      ),
    );
  }

  TextStyle get bold {
    return GoogleFonts.jost(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: fontSize!,
          letterSpacing: -1.41
    ));
  }

  static TextStyle boldSpacing141 = GoogleFonts.jost(
      textStyle: const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: -1.41,
  ));

  static TextStyle modalTitle = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          letterSpacing: -1.41,
          height: 0.1));

  TextStyle get boldSpacing041 {
    return GoogleFonts.jost(
        textStyle: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      letterSpacing: -0.41,
    ));
  }
}
