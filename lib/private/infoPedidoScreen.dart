import 'dart:convert';

import 'package:dibs/main.dart';
import 'package:dibs/models/cards.dart';
import 'package:dibs/models/resumoDaCompraString.dart';
import 'package:dibs/models/ticketInfoInput.dart';
import 'package:dibs/models/ticketLote.dart';
import 'package:dibs/private/formaDePagamento.dart';
import 'package:dibs/private/resumoDaCompra.dart';
import 'package:dibs/repositories/card-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../models/ticketClientInput.dart';
import '../shared/functions/utils.dart';
import '../widget/meuCartaoComponente.dart';

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

  Cards? card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Pedido',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Forma de pagamento',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ]).corSublinhada),
                InkWell(
                    onTap: () async {
                      final cards = await CardRepository(dio).getCards();

                      card = await showModalBottomSheet<Cards>(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => FormaDePagamento(cards: cards),
                      );
                      setState(() {});
                    },
                    child: card == null
                        ? Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            elevation: 4,
                            child: const Padding(
                              padding: EdgeInsets.zero,
                              child: SizedBox(
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.credit_card,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Cartão de Crédito',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Icon(Icons.edit),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MeuCartaoComponente(
                                pedido: true,
                                nome: card!.name,
                                numero:
                                    substituirTresPrimeirosGruposPorAsteriscos(
                                        card!.number),
                                tipo: "Crédito"),
                          )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResumoDaCompra(
                                    compraComOrganizacao:
                                        widget.compraComOrganizacao,
                                    ticketOrganizer: widget.ticketOrganizer,
                                    resumoDaCompra: widget.resumoDaCompra,
                                    ticketInfo: widget.ticketInfo,
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
                          'Avançar',
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
