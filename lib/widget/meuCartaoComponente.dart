import 'package:dibs/widget/shadowedCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/textStyle.dart';

class MeuCartaoComponente extends StatelessWidget {
  String? numero;
  String? tipo;
  String? nome;
  bool? pedido;

  MeuCartaoComponente(
      {super.key,
      required this.numero,
      required this.tipo,
      required this.nome,
      required this.pedido});

  @override
  Widget build(BuildContext context) {
    return pedido! ? InkWell(
      child: ShadowedCard(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.09,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              // height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                          child: Icon(
                            FontAwesomeIcons.solidCreditCard,
                            size: 22),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: 7, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(numero!,
                                      style: TextStyleService(
                                          fontSize: 14,
                                          color: Colors.black).creditCardComponent),
                                ],
                              ),
                              Text(
                                nome!.toUpperCase(),
                                style: TextStyleService(
                                    fontSize: 11,
                                    color: Colors.black).creditCardComponent,
                              ),
                              Text(
                                tipo!,
                                style: TextStyleService(
                                    fontSize: 11,
                                    color: Color(0xFFB3B0B0)).creditCardComponent,
                              )
                            ],
                          )
                      )
                    ],
                  ),
                  SizedBox()
                  // Icon(
                  //     FontAwesomeIcons.solidPenToSquare,
                  //     size: 20)
                ],
              ),
            ),
          ),
      ),
    )
    : ShadowedCard(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            // height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.only(start: 5, end: 20),
                        child: Icon(
                          FontAwesomeIcons.solidCreditCard,
                          size: 22,
                        )
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(numero!,
                                    style: TextStyleService(
                                        fontSize: 14,
                                        color: Colors.black).creditCardComponent),
                              ],
                            ),
                            Text(
                              nome!.toUpperCase(),
                              style: TextStyleService(
                                  fontSize: 11,
                                  color: Colors.black).creditCardComponent,
                            ),
                            Text(
                              tipo!,
                              style: TextStyleService(
                                  fontSize: 11,
                                  color: Color(0xFFB3B0B0)).creditCardComponent,
                            )
                          ],
                        )
                    )
                  ],
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                        BorderRadius.circular(5)),
                    height: 35,
                    width: 35,
                    child: Icon(FontAwesomeIcons.solidTrashCan,
                        size: 18,
                        color: Color(0xFFFB6464)),
                  ),
                ),
                // Icon(
                //     FontAwesomeIcons.solidPenToSquare,
                //     size: 20)
              ],
            ),
          ),
        ));
  }
}
