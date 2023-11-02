import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';

class BannerCategoriaEvento extends StatelessWidget {
  ImageProvider image;
  String titulo;
  String data;
  String hora;
  String local;
  Color corUm;
  Color corDois;

  BannerCategoriaEvento(
      {super.key,
      required this.image,
      required this.titulo,
      required this.data,
      required this.local,
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
          borderRadius: BorderRadiusDirectional.circular(15)),
      height: 70,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0)),
                child: Image(image: image)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarDay,
                          size: 16,
                        ),
                        SizedBox(width: 2),
                        Text(data!,
                            style: TextStyleService(fontSize: 11).eventDateTime)
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.solidClock, size: 16),
                        SizedBox(width: 2),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            hora!,
                            style: TextStyleService(fontSize: 11).eventDateTime)
                          ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 1.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                        child: Text(
                      titulo,
                      style: TextStyleService.labelSubtitle,
                    ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                      size: 14,
                      color: ColorService.cinzaBannerIngresso,
                    ),
                    SizedBox(width: 2),
                    Text(local, style: TextStyleService.eventLocalCategory)
                  ],
                ),
              ],
            )
          ]),
    );
  }
}
