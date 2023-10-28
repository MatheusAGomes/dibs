import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';

class BannerCategoriaEvento extends StatelessWidget {
  ImageProvider image;
  String titulo;
  String data;
  String hora;
  Color corUm;
  Color corDois;

  BannerCategoriaEvento(
      {super.key,
      required this.image,
      required this.titulo,
      required this.data,
      required this.corUm,
      required this.corDois,
      required this.hora});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [corUm, corDois]),
          borderRadius: BorderRadiusDirectional.circular(11)),
      height: 70,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(11),
                    bottomLeft: Radius.circular(11)),
                child: Image(image: image)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 18,
                        ),
                        Text(
                          data,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 18,
                        ),
                        Text(
                          hora,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  addEllipsis(titulo, 16),
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            )
          ]),
    );
  }
}
