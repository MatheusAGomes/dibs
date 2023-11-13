import 'dart:convert';

import 'package:dibs/main.dart';
import 'package:dibs/models/cardSelect.dart';
import 'package:dibs/models/cards.dart';
import 'package:dibs/models/resumoDaCompraString.dart';
import 'package:dibs/models/ticketInfoInput.dart';
import 'package:dibs/models/ticketLote.dart';
import 'package:dibs/private/formaDePagamento.dart';
import 'package:dibs/private/resumoDaCompra.dart';
import 'package:dibs/repositories/card-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

import '../models/ticketClientInput.dart';
import '../shared/functions/utils.dart';
import '../widget/meuCartaoComponente.dart';
import '../widget/modalSecuresale.dart';

class InfoPedidoScreen extends StatefulWidget {
  List<TicketLote>? ticketInfo;
  TicketClientInput? ticketOrganizer;
  List<ResumoDaCompraString> resumoDaCompra;
  bool compraComOrganizacao;
  InfoPedidoScreen(
      {super.key,
      required this.ticketOrganizer,
      required this.ticketInfo,
      required this.resumoDaCompra,
      required this.compraComOrganizacao});

  @override
  State<InfoPedidoScreen> createState() => _InfoPedidoScreenState();
}

class _InfoPedidoScreenState extends State<InfoPedidoScreen> {
  TextEditingController nomeController = TextEditingController();
  bool checkboxValue = false;

  CardSelect? card;

  @override
  Widget build(BuildContext context) {
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Forma de pagamento',
                        style: TextStyleService(categoryShadow: <Shadow>[
                          Shadow(
                              offset: Offset(1.5, 1.5),
                              color: Color.fromRGBO(126, 244, 209, 0.72))
                        ], fontSize: 20)
                            .corSublinhada),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    InkWell(
                        onTap: () async {
                          card = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormaDePagamento()));
                          // showModalBottomSheet<Cards>(
                          //   useSafeArea: true,
                          //   isScrollControlled: true,
                          //   context: context,
                          //   builder: (context) =>
                          //       FormaDePagamento(cards: cards),
                          // );
                          setState(() {});
                        },
                        child: card == null
                            ? ShadowedCard(
                                child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: SizedBox(
                                  // height: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.solidCreditCard,
                                            size: 22,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'Cartão de Crédito',
                                            style: TextStyleService(
                                                    fontSize: 16,
                                                    letterSpacing: -0.41)
                                                .medium,
                                          ),
                                        ],
                                      ),
                                      Icon(FontAwesomeIcons.solidPenToSquare,
                                          size: 20)
                                    ],
                                  ),
                                ),
                              ))
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: MeuCartaoComponente(
                                    pedido: true,
                                    nome: card!.name,
                                    numero:
                                        substituirTresPrimeirosGruposPorAsteriscos(
                                            card!.number!),
                                    tipo: "Crédito"),
                              )),
                    widget.compraComOrganizacao
                        ? const SizedBox(
                            height: 20,
                          )
                        : Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Compra protegida por',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: -0.41))),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01),
                                  SvgPicture.asset(
                                      "assets/icons/SecureResale.svg",
                                      width: 95),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    isScrollControlled: true,
                                    context: context,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10)),
                                    ),
                                    builder: (BuildContext context) {
                                      return ModalSecuresale();
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text('Saiba mais...',
                                        style: GoogleFonts.jost(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                letterSpacing: -0.41,
                                                color: Color(0xFF198A68)))),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.015),
                                    Icon(FontAwesomeIcons.circleInfo,
                                        size: 16, color: Color(0xFF198A68))
                                  ],
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonPadrao(
                    text: "Avançar",
                    click: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResumoDaCompra(
                                    cardSelect: card,
                                    compraComOrganizacao:
                                        widget.compraComOrganizacao,
                                    ticketOrganizer: widget.ticketOrganizer,
                                    resumoDaCompra: widget.resumoDaCompra,
                                    ticketInfo: widget.ticketInfo,
                                  )));
                    },
                    width: 0.5,
                    enable: true,
                    delete: false),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
