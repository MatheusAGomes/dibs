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
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/lote.dart';
import 'infoPedidoScreen.dart';

class InfoIngressoScreen extends StatefulWidget {
  String id;
  String? nomeDoEvento;
  String? data;
  String? hora;
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
      required this.lotes});

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
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 19,
                  right: 19),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          Text(widget.data!)
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.schedule),
                          Text(widget.hora!)
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.nomeDoEvento!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Text(limitTo14Words(widget.descricao!)),
                  const SizedBox(
                    height: 10,
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.confirmation_num,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Ver ingressos anunciados',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 20),
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
                        widget.lotes[index].hasHalfPriceTickets
                            ? BannerCompraIngresso(
                                tipoDoIngresso: 'Meia-entrada',
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
                                      tipo: 'Meia-Entrada',
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
                  Center(
                    child: InkWell(
                      onTap: () {
                        print(listaFinal);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoPedidoScreen(
                                      compraComOrganizacao: true,
                                      resumoDaCompra: listaDeIngressos,
                                      ticketInfo: listaFinal,
                                      ticketOrganizer: null,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color(0xFF198A68),
                        ),
                        width: 120,
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Comprar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover, image: widget.fotoDoEvento!),
              ),
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
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
