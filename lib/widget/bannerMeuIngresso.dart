import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class BannerMeuIgresso extends StatelessWidget {
  ImageProvider image;
  String titulo;
  String data;
  String hora;
  String lote;
  String tipo;
  Color corBanner;
  Color corDoLote;

  BannerMeuIgresso(
      {required this.image,
      required this.titulo,
      required this.data,
      required this.hora,
      required this.lote,
      required this.tipo,
      required this.corBanner,
      required this.corDoLote});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: image),
              borderRadius: BorderRadiusDirectional.circular(10)),
          width: 300,
        ),
        Container(
          height: 70,
          width: 300,
          decoration: BoxDecoration(
            color: corBanner,
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                bottomStart: Radius.circular(10)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
              height: 70,
              width: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined),
                          Text(data)
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [Icon(Icons.schedule), Text(hora)],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        lote,
                        style: TextStyle(
                            color: corDoLote, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        tipo,
                        style: TextStyle(color: Colors.black54),
                      )
                    ],
                  )
                ],
              )),
        ),
      ]),
    );
  }
}