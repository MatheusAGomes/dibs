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

  static TextStyle regularTitle = GoogleFonts.jost(
    textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        letterSpacing: -1.41,
    )
  );

  static TextStyle ticketBannerTitle = GoogleFonts.jost(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        letterSpacing: -0.61,
      )
  );

  static TextStyle ticketBannerDateTime = GoogleFonts.jost(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        letterSpacing: -1.5,
        height: 0.2
      )
  );

  // static TextStyle ticketBannerBatch = GoogleFonts.jost(
  //     textStyle: const TextStyle(
  //         fontWeight: FontWeight.w500,
  //         fontSize: 13,
  //         letterSpacing: -1.5,
  //         height: 0.2,
  //     )
  // );

  static TextStyle ticketBannerType = GoogleFonts.jost(
      textStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 0,
          height: 1.1,
          color: Color(0x8A000000)
      )
  );

  static TextStyle toggleSwitchActiveText = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 11,
        letterSpacing: -0.08,
        color: Color.fromRGBO(0, 0, 0, 1)
      )
  );

  static TextStyle toggleSwitchInactiveText = GoogleFonts.inter(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 11,
        letterSpacing: -0.08,
      )
  );

  static TextStyle iconButtonText = GoogleFonts.jost(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        letterSpacing: -1.08,
      )
  );

}
