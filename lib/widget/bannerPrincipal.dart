import 'package:dibs/private/infoIngresso.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/service/colorService.dart';

class BannerPrincipal extends StatelessWidget {
  ImageProvider image;
  String titulo;

  BannerPrincipal({required this.image, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return InfoIngressoScreen(
            nomeDoEvento: titulo,
            data: '24/08/2023',
            descricao:
                'Menos é mais novamente em Campinas para mais um show maravilhoso open bar e open food...',
            fotoDoEvento: image,
            hora: '19:00',
          );
        },
      ),
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: image),
              borderRadius: BorderRadiusDirectional.circular(10)),
          width: 200,
        ),
        Container(
          width: 200,
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
            height: 60,
            width: 200,
            child: Text(
              titulo,
              style: GoogleFonts.jost(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.41,
                      height: 1.13)),
            ),
          ),
        ),
      ]),
    );
  }
}
