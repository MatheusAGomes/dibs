import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class BannerCategoria extends StatelessWidget {
  Icon icon;
  String titulo;
  Color corUm;
  Color corDois;

  BannerCategoria(
      {required this.icon,
      required this.titulo,
      required this.corUm,
      required this.corDois});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
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
            style: TextStyle(fontWeight: FontWeight.w900),
          )
        ]),
      ),
    );
  }
}
