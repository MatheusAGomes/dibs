import 'package:dibs/private/infoMeuIngresso.dart';
import 'package:dibs/private/meuEventoScreen.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/colorService.dart';

class BannerNewMeuIngresso extends StatelessWidget {
  NetworkImage image;
  String titulo;
  String data;
  String hora;
  String lote;
  String tipo;
  String local;
  Color corBanner;
  Color corDoLote;
  bool ticket;

  BannerNewMeuIngresso(
      {required this.image,
      required this.titulo,
      required this.data,
      required this.hora,
      required this.lote,
      required this.tipo,
      required this.corBanner,
      required this.corDoLote,
      required this.ticket,
      this.local = "Campinas - SP"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: image),
              borderRadius: BorderRadiusDirectional.circular(10)),
          width: 300,
        ),
        Container(
          height: 80,
          width: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  blurStyle: BlurStyle.inner)
            ],
            color: corBanner,
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                bottomStart: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: SizedBox(
                // height: 80,
                // width: 300,
                child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarDay,
                          size: 18,
                        ),
                        SizedBox(width: 2),
                        Text(data, style: TextStyleService.ticketBannerDateTime)
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(FontAwesomeIcons.solidClock, size: 18),
                        SizedBox(width: 2),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            hora,
                            style: TextStyleService.ticketBannerDateTime,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        titulo,
                        style: TextStyleService.ticketBannerTitle,
                      ),
                    ],
                  ),
                // ticket
                //     ?
                  // Row(
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           children: [
                  //             Text(
                  //               lote,
                  //               style: TextStyleService(color: corDoLote)
                  //                   .ticketBannerBatch,
                  //             ),
                  //             SizedBox(
                  //               width: 10,
                  //             ),
                  //             Text(
                  //               tipo,
                  //               style: TextStyleService.ticketBannerType,
                  //             )
                  //           ],
                  //         )
                        // :
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        size: 16,
                        color: ColorService.cinzaBannerIngresso,
                      ),
                      SizedBox(width: 4),
                      Text(local, style: TextStyleService.ticketBannerType)
                    ],
                  ),
              ],
            )),
          ),
        ),
      ]),
    );
  }
}
