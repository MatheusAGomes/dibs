import 'package:dibs/models/cardSelect.dart';
import 'package:dibs/models/ticketInfoInput.dart';
import 'package:dibs/models/ticketLote.dart';
import 'package:dibs/models/ticketOrganizer.dart';
import 'package:dibs/private/compraFinalizada.dart';
import 'package:dibs/shared/functions/utils.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../models/resumoDaCompraString.dart';
import '../models/ticketClientInput.dart';
import '../repositories/ticket-repository.dart';

class ResumoDaCompra extends StatefulWidget {
  List<TicketLote>? ticketInfo;
  TicketClientInput? ticketOrganizer;
  List<ResumoDaCompraString> resumoDaCompra;
  bool compraComOrganizacao;
  CardSelect? cardSelect;
  ResumoDaCompra(
      {required this.ticketInfo,
      required this.resumoDaCompra,
      required this.compraComOrganizacao,
      required this.ticketOrganizer,
      required this.cardSelect});

  @override
  State<ResumoDaCompra> createState() => _ResumoDaCompraState();
}

class _ResumoDaCompraState extends State<ResumoDaCompra> {
  @override
  Widget build(BuildContext context) {
    bool checkboxValue = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Pedido',
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Resumo da compra',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ], fontSize: 20)
                        .corSublinhada),
                Text('Ingressos', style: TextStyleService.eventBatch),
                ShadowedCard(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        Column(
                            children: List.generate(
                                widget.resumoDaCompra.length, (index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${addEllipsis('1x ${widget.resumoDaCompra[index].name}', 22)}',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        letterSpacing: -0.41,
                                      ))),
                                  Text(
                                    '${addEllipsis('${widget.resumoDaCompra[index].tipo} - R\$ ${widget.resumoDaCompra[index].preco}', 28)}',
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            letterSpacing: -0.41,
                                            color: Color(0xFF6A6A6A),
                                            height: 1.2)),
                                  ),
                                ],
                              ),
                              Text('R\$ ${widget.resumoDaCompra[index].preco}',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    letterSpacing: -0.91,
                                  )))
                            ],
                          );
                        })),
                        Column(
                          children: [
                            Divider(
                              color: Color(0xFFD9D9D9),
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: -0.41,
                                  )),
                                ),
                                Text(
                                  "R\$ ${widget.resumoDaCompra.map((e) => e.preco.toDouble()).reduce((value, element) => value + element)}",
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: -0.91,
                                  )),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
                Text('Forma de pagamento', style: TextStyleService.eventBatch),
                ShadowedCard(
                    child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 15),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.solidCreditCard, size: 16),
                            SizedBox(width: 15),
                            Text('Cartão de Crédito',
                                style: TextStyleService.ticketInput)
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.018),
                        Text(
                          '${insertSpaces(widget.cardSelect!.number)}',
                          style: TextStyleService(
                                  fontSize: 16, color: Colors.black)
                              .creditCardComponent,
                        ),
                        Text('${widget.cardSelect!.name}',
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    letterSpacing: -0.41,
                                    color: Color(0xFF6A6A6A)))),
                        Divider(
                          color: Color(0xFFD9D9D9),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Parcelamento',
                                style: GoogleFonts.jost(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  letterSpacing: -0.41,
                                ))),
                            Flexible(
                                child: Text(
                                    '1x de R\$ '
                                    '${widget.resumoDaCompra.map((e) => e.preco.toDouble()).reduce((value, element) => value + element)}\n'
                                    '(sem juros)',
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.jost(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            letterSpacing: -0.41,
                                            height: 1))))
                          ],
                        )
                      ],
                    ),
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                ButtonPadrao(
                    text: 'Finalizar pedido',
                    click: () async {
                      if (widget.compraComOrganizacao) {
                        final a = await TicketRepository(dio).buyTicket(
                            TicketOrganizer(ticketBatch: widget.ticketInfo!));
                      } else {
                        final b = await TicketRepository(dio)
                            .buyTicketFromClient(widget.ticketOrganizer!);
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompraFinalizada(
                                    total: widget.resumoDaCompra
                                        .map((e) => e.preco.toDouble())
                                        .reduce((value, element) =>
                                            value + element),
                                  )));
                    },
                    width: 0.5,
                    enable: true,
                    delete: false),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
