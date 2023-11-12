import 'package:dibs/models/ticketClient.dart';
import 'package:dibs/models/ticketsForSale.dart';
import 'package:dibs/private/resumoDaCompra.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/buttonNewAction.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Ingressos Anunciados',
          style: TextStyleService.appBar,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Marketplace',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ], fontSize: 22)
                        .corSublinhada),
                Divider(
                  color: Color(0x66000000),
                  thickness: 1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Column(
                    children: List.generate(widget.tickets.length, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: BannerCompraIngressoTerceiro(
                        lote: widget.tickets[index].name,
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
                                    listaDeIngressos![i].ticketInfo[0],
                                    a.ticketInfo[0])) {
                              c = i;
                              break;
                            }
                          }
                          if (c != -1) listaDeIngressos!.removeAt(c);

                          ResumoDaCompraString l = ResumoDaCompraString(
                            name: widget.tickets[index].event,
                            tipo: widget.tickets[index].halfPrice
                                ? 'Meia-entrada'
                                : 'Inteira',
                            preco: widget.tickets[index].halfPrice
                                ? (widget.tickets[index].resalePrice)
                                : widget.tickets[index].resalePrice,
                          );

                          int d = -1;
                          for (int i = 0; i < listaDeResumo.length; i++) {
                            if (listaDeResumo[i].name == l.name &&
                                listaDeResumo[i].tipo == l.tipo &&
                                listaDeResumo[i].preco == l.preco) {
                              d = i;
                              break;
                            }
                          }
                          if (d != -1) listaDeResumo.removeAt(d);
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
                                ? (widget.tickets[index].resalePrice)
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
                            ? 'R\$ ${(widget.tickets[index].resalePrice)}'
                            : 'R\$ ${widget.tickets[index].resalePrice}'),
                  );
                })),
                SizedBox(
                  height: 20,
                ),
                ButtonPadrao(
                  text: 'Comprar',
                  click: () {
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
                  width: 0.45,
                  enable: true,
                  delete: false,
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
