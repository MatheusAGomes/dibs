import 'dart:math';

import 'package:dibs/models/resumoDaCompraString.dart';
import 'package:dibs/models/ticketInfoInput.dart';
import 'package:dibs/models/ticketLote.dart';
import 'package:dibs/models/ticketsForSale.dart';
import 'package:dibs/private/ingressosAnunciados.dart';
import 'package:dibs/private/resumoDaCompra.dart';
import 'package:dibs/repositories/loteEvent-repository.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/functions/utils.dart';
import 'package:dibs/widget/bannerCompraIngresso.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../models/lote.dart';
import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';
import 'infoPedidoScreen.dart';

class InfoIngressoScreen extends StatefulWidget {
  String id;
  String? nomeDoEvento;
  String? data;
  String? hora;
  String? local;
  String? descricao;
  ImageProvider? fotoDoEvento;
  List<Lote> lotes;
  InfoIngressoScreen(
      {super.key,
      required this.id,
      required this.nomeDoEvento,
      required this.data,
      required this.descricao,
      required this.fotoDoEvento,
      required this.hora,
      required this.lotes,
      required this.local});

  @override
  State<InfoIngressoScreen> createState() => _InfoIngressoScreenState();
}

class _InfoIngressoScreenState extends State<InfoIngressoScreen> {
  @override
  Widget build(BuildContext context) {
    List<TicketLote> listaFinal = [];
    List<ResumoDaCompraString> listaDeIngressos = [];

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.20,
                  left: 19,
                  right: 19),
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
                          Text(widget.data!,
                              style: TextStyleService.eventDateTime)
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(FontAwesomeIcons.solidClock, size: 18),
                          SizedBox(width: 2),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              widget.hora!,
                              style: TextStyleService.eventDateTime,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.nomeDoEvento!,
                        style: TextStyleService.boldSpacing141,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        size: 17,
                        color: ColorService.cinzaBannerIngresso,
                      ),
                      SizedBox(width: 4),
                      Text(widget.local!, style: TextStyleService.eventLocal)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Row(
                    children: [
                      Text(limitTo14Words(widget.descricao!),
                        textAlign: TextAlign.left,
                        style: TextStyle(letterSpacing: -0.41))],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  InkWell(
                    onTap: () async {
                      List<TicketForSale> tickets = await TicketRepository(dio)
                          .getTicketForSale(widget.id);
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          useSafeArea: true,
                          builder: (context) => IngressosAnunciadosScreen(
                                tickets: tickets,
                              ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.rotate(angle: 67 * pi / 180,
                          child: Icon(
                            FontAwesomeIcons.ticketSimple,
                            size: 14,
                            color: Colors.grey,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Ver ingressos anunciados',
                          style: TextStyleService.announcedTickets,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          FontAwesomeIcons.angleRight,
                          size: 16,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  Column(
                      children: List.generate(widget.lotes.length, (index) {
                    int quantidadeMeia = 0;
                    int quantidadeInteira = 0;
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.lotes[index].name,
                              style: TextStyleService.eventBatch,
                            ),
                          ],
                        ),
                        widget.lotes[index].hasHalfPriceTickets
                            ? BannerCompraIngresso(
                                tipoDoIngresso: 'Inteira',
                                valor: (widget.lotes[index].announcedPrice)
                                    .toString(),
                                quantidade: quantidadeInteira,
                                less: () {
                                  TicketLote a = TicketLote(
                                      batchId: widget.lotes[index].id,
                                      ticketInfo: [
                                        TicketInfoInput(
                                            name: '',
                                            cpf: '',
                                            halfPrice: false,
                                            isOwner: true)
                                      ]);
                                  int c = -1;
                                  for (int i = 0; i < listaFinal.length; i++) {
                                    if (listaFinal[i].batchId == a.batchId &&
                                        listaFinal[i].ticketInfo[0].halfPrice ==
                                            a.ticketInfo[0].halfPrice) {
                                      c = i;
                                      break;
                                    }
                                  }
                                  if (c != -1) listaFinal.removeAt(c);
                                },
                                add: () {
                                  listaDeIngressos.add(ResumoDaCompraString(
                                      name: widget.lotes[index].name,
                                      tipo: 'Inteira',
                                      preco:
                                          widget.lotes[index].announcedPrice));
                                  listaFinal.add(
                                    TicketLote(
                                        batchId: widget.lotes[index].id,
                                        ticketInfo: [
                                          TicketInfoInput(
                                              name: '',
                                              cpf: '',
                                              halfPrice: false,
                                              isOwner: true)
                                        ]),
                                  );
                                })
                            : SizedBox(),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        widget.lotes[index].hasHalfPriceTickets
                            ? BannerCompraIngresso(
                                tipoDoIngresso: 'Meia entrada',
                                valor: (widget.lotes[index].announcedPrice / 2)
                                    .toString(),
                                quantidade: quantidadeMeia,
                                less: () {
                                  TicketLote a = TicketLote(
                                      batchId: widget.lotes[index].id,
                                      ticketInfo: [
                                        TicketInfoInput(
                                            name: '',
                                            cpf: '',
                                            halfPrice: true,
                                            isOwner: true)
                                      ]);
                                  int c = -1;
                                  for (int i = 0; i < listaFinal.length; i++) {
                                    if (listaFinal[i].batchId == a.batchId &&
                                        listaFinal[i].ticketInfo[0].halfPrice ==
                                            a.ticketInfo[0].halfPrice) {
                                      c = i;
                                      break;
                                    }
                                  }
                                  if (c != -1) listaFinal.removeAt(c);
                                },
                                add: () {
                                  listaDeIngressos.add(ResumoDaCompraString(
                                      name: widget.lotes[index].name,
                                      tipo: 'Meia entrada',
                                      preco:
                                          widget.lotes[index].announcedPrice /
                                              2));
                                  listaFinal.add(
                                    TicketLote(
                                        batchId: widget.lotes[index].id,
                                        ticketInfo: [
                                          TicketInfoInput(
                                              name: '',
                                              cpf: '',
                                              halfPrice: true,
                                              isOwner: true)
                                        ]),
                                  );
                                })
                            : SizedBox(),
                      ],
                    );
                  })),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  widget.lotes.isNotEmpty ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonPadrao(
                          text: 'Comprar',
                          click: () {
                            print(listaFinal);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoPedidoScreen(
                                        compraComOrganizacao: true,
                                        resumoDaCompra: listaDeIngressos,
                                        ticketInfo: listaFinal,
                                        ticketOrganizer: null
                                    )));
                          },
                          width: 0.45,
                          enable: true,
                          delete: false
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04)
                    ],
                  )
                  : SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover, image: widget.fotoDoEvento!),
              ),
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
