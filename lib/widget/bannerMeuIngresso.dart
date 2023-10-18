import 'package:dibs/private/infoMeuIngresso.dart';
import 'package:dibs/private/meuEventoScreen.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/colorService.dart';

class BannerMeuIngresso extends StatelessWidget {
  ImageProvider image;
  String titulo;
  String data;
  String hora;
  String lote;
  String tipo;
  Color corBanner;
  Color corDoLote;
  bool anuncio;
  bool empresa;

  BannerMeuIngresso(
      {required this.image,
      required this.titulo,
      required this.data,
      required this.hora,
      required this.lote,
      required this.tipo,
      required this.corBanner,
      required this.corDoLote,
      required this.anuncio,
      required this.empresa});

  @override
  Widget build(BuildContext context) {
    return anuncio
        ? SizedBox(
            height: 220,
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
                                Text(data,
                                  style: TextStyleService.ticketBannerDateTime
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Row(
                              children: [
                                // Icon(Icons.schedule),
                                Text(hora,
                                style: TextStyleService.ticketBannerDateTime
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              titulo,
                              style: TextStyleService.ticketBannerTitle
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              lote,
                              style: TextStyle(
                                  color: corDoLote,
                                  fontWeight: FontWeight.w900),
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
          )
        : InkWell(
            onTap: () {
              if (empresa == false) {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return InfoMeuIngressoScreen(
                      codigoDoIngresso: 'de7a89f51g477c82e23f68g',
                      cpf: '222.222.222-22',
                      fotoDoEvento: image,
                      nomeDoTitular: 'Matheus Assunção Gomes',
                      status: true,
                    );
                  },
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MeuEventoScreen()));
              }
            },
            child: SizedBox(
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
                                  Icon(FontAwesomeIcons.calendarDay, size: 20,),
                                  Text(data,
                                      style: TextStyleService.ticketBannerDateTime
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.schedule),
                                  Text(hora,
                                      style: TextStyleService.ticketBannerDateTime
                                  )],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                titulo,
                                style: TextStyleService.ticketBannerTitle,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                lote,
                                style: TextStyle(
                                    color: corDoLote,
                                    fontWeight: FontWeight.w900),
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
            ),
          );
  }
}
