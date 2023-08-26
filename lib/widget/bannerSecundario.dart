import 'package:flutter/material.dart';

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
          height: 70,
          width: 100,
          child: Text(
            titulo,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    ]);
  }
}
