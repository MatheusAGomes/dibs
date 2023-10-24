import 'package:dibs/private/categoriaScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerCategoria extends StatelessWidget {
  Icon icon;
  String titulo;
  Color corUm;
  Color corDois;

  BannerCategoria(
      {super.key,
      required this.icon,
      required this.titulo,
      required this.corUm,
      required this.corDois});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoriaScreen(corUm, titulo, corDois)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [corUm, corDois]),
            borderRadius: BorderRadiusDirectional.circular(10)),
        height: 58,
        width: 125,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          icon,
          Text(
            titulo,
            style: GoogleFonts.jost(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          )
        ]),
      ),
    );
  }
}
