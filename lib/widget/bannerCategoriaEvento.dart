import 'package:dibs/private/categoriaScreen.dart';
import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class BannerCategoriaEvento extends StatelessWidget {
  ImageProvider image;
  String titulo;
  String data;
  String hora;
  Color corUm;
  Color corDois;

  BannerCategoriaEvento(
      {required this.image,
      required this.titulo,
      required this.data,
      required this.corUm,
      required this.corDois,
      required this.hora});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [corUm, corDois]),
            borderRadius: BorderRadiusDirectional.circular(11)),
        height: 70,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
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
                          Icon(
                            Icons.calendar_month,
                            size: 18,
                          ),
                          Text(
                            data,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 18,
                          ),
                          Text(
                            hora,
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
