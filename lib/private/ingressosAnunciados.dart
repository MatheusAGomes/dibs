import 'package:dibs/models/ticketClient.dart';
import 'package:dibs/models/ticketsForSale.dart';
import 'package:dibs/private/resumoDaCompra.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';

import '../models/resumoDaCompraString.dart';
import '../models/ticketClientInfoInput.dart';
import '../models/ticketClientInput.dart';
import '../models/ticketInfoInput.dart';
import '../models/ticketLote.dart';
import '../widget/bannerCompraIngresso.dart';
import '../widget/bannerCompraIngressoTerceiro.dart';
import 'infoPedidoScreen.dart';

class IngressosAnunciadosScreen extends StatefulWidget {
  List<TicketForSale> tickets;
  IngressosAnunciadosScreen({required this.tickets});

  @override
  State<IngressosAnunciadosScreen> createState() =>
      _IngressosAnunciadosScreenState();
}

class _IngressosAnunciadosScreenState extends State<IngressosAnunciadosScreen> {
  // TicketClientInput? listaDeIngressos;
  List<TicketClient>? listaDeIngressos = [];
  List<ResumoDaCompraString> listaDeResumo = [];

  bool verificaIgualdade(TicketClientInfoInput info, TicketClientInfoInput a) {
    if (info.batchId == a.batchId &&
        info.name == a.name &&
        info.cpf == a.cpf &&
        info.halfPrice == a.halfPrice &&
        info.isOwner == a.isOwner) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Ingressos Anunciados',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Marketing place',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ]).corSublinhada),
                Divider(),
                Column(
                    children: List.generate(widget.tickets.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: BannerCompraIngressoTerceiro(
                        less: () {
                          TicketClient a = TicketClient(
                              clientId: widget.tickets[index].sellerId,
                              eventId: widget.tickets[index].eventId,
                              ticketInfo: [
                                TicketClientInfoInput(
                                    batchId: widget.tickets[index].id,
                                    cpf: '',
                                    isOwner: true,
                                    halfPrice: widget.tickets[index].halfPrice,
                                    name: '')
                              ]);
                          int c = -1;
                          for (int i = 0; i < listaDeIngressos!.length; i++) {
                            if (listaDeIngressos![i].clientId == a.clientId &&
                                listaDeIngressos![i].eventId == a.eventId &&
                                verificaIgualdade(
                                    listaDeIngressos![index].ticketInfo[0],
                                    a.ticketInfo[0])) {
                              c = i;
                              break;
                            }
                          }
                          if (c != -1) listaDeIngressos!.removeAt(c);
                        },
                        add: () {
                          listaDeIngressos!.add(TicketClient(
                              clientId: widget.tickets[index].sellerId,
                              eventId: widget.tickets[index].eventId,
                              ticketInfo: [
                                TicketClientInfoInput(
                                    batchId: widget.tickets[index].id,
                                    cpf: '',
                                    isOwner: true,
                                    halfPrice: widget.tickets[index].halfPrice,
                                    name: '')
                              ]));

                          listaDeResumo.add(ResumoDaCompraString(
                            name: widget.tickets[index].event,
                            tipo: widget.tickets[index].halfPrice
                                ? 'Meia-entrada'
                                : 'Inteira',
                            preco: widget.tickets[index].halfPrice
                                ? (widget.tickets[index].resalePrice) / 2
                                : widget.tickets[index].resalePrice,
                          ));
                        },
                        quantidadeDisponivel:
                            widget.tickets[index].numberOfTickets,
                        nome: widget.tickets[index].seller,
                        tipoDoIngresso: widget.tickets[index].halfPrice
                            ? 'Meia entrada'
                            : 'Inteira',
                        valor: widget.tickets[index].halfPrice
                            ? 'R\$ ${(widget.tickets[index].resalePrice) / 2}'
                            : 'R\$ ${widget.tickets[index].resalePrice}'),
                  );
                })),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoPedidoScreen(
                                    compraComOrganizacao: false,
                                    ticketInfo: null,
                                    resumoDaCompra: listaDeResumo,
                                    ticketOrganizer: TicketClientInput(
                                        ticketClients: listaDeIngressos!),
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
              ],
            ),
          )),
        ),
      ),
    );
  }
}
