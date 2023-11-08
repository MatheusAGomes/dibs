import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/service/textStyle.dart';

class ModalSecuresale extends StatelessWidget {
  ModalSecuresale();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Securesale',
                    style: TextStyleService.modalTitle,
                  ),
                  InkWell(
                    child: Icon(FontAwesomeIcons.xmark, size: 18),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(
                color: Color(0x66000000),
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('O que é',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: -0.41))),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                  SvgPicture.asset("assets/icons/SecureResale.svg", width: 100),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                  Text('?',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: -0.41))),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                  "O SecureSale garante que seu ingresso seja único, "
                      "evitando que, a partir de uma transferência, "
                      "os dois ingressos (de quem transferiu e quem recebeu) "
                      "sejam válidos.",
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13  ,
                          letterSpacing: -0.41))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                  "No momento da transferência do ingresso, o QR Code do "
                      "cliente que transferiu é cancelado e um novo QR Code "
                      "é gerado (esse QR pertence unica e exclusivamente ao "
                      "cliente que recebeu o ingresso da transferência).",
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13  ,
                          letterSpacing: -0.41))),

            ],
          ),
        ),
      ),
    );
  }
}
