import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/service/colorService.dart';

class BannerSecundario extends StatelessWidget {
  ImageProvider image;
  String titulo;

  BannerSecundario({required this.image, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomLeft, children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: image,
            ),
            borderRadius: BorderRadiusDirectional.circular(10)),
        width: 120,
      ),
      Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          height: 45,
          width: 120,
          child: Text(
            titulo,
            style: GoogleFonts.jost(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.41,
                    height: 1.13
                )
            ) ,
          ),
        ),
      ),
    ]);
  }
}
