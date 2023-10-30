import 'package:dibs/models/ticketInfoInput.dart';
import 'package:dibs/models/ticketLote.dart';
import 'package:dibs/models/ticketOrganizer.dart';
import 'package:dibs/private/compraFinalizada.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/resumoDaCompraString.dart';
import '../models/ticketClientInput.dart';
import '../repositories/ticket-repository.dart';

class ResumoDaCompra extends StatefulWidget {
  List<TicketLote>? ticketInfo;
  TicketClientInput? ticketOrganizer;
  List<ResumoDaCompraString> resumoDaCompra;
  bool compraComOrganizacao;
  ResumoDaCompra(
      {required this.ticketInfo,
      required this.resumoDaCompra,
      required this.compraComOrganizacao,
      required this.ticketOrganizer});

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
                Text('Resumo da compra',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ], fontSize: 18).corSublinhada),
                const Text('Ingressos',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: SizedBox(
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
                                      '1x - ${widget.resumoDaCompra[index].name}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${widget.resumoDaCompra[index].tipo} - R\$ ${widget.resumoDaCompra[index].preco}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          })),
                          Column(
                            children: [
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "R\$ ${widget.resumoDaCompra.map((e) => e.preco.toDouble()).reduce((value, element) => value + element)}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xFF198A68),
                      ),
                      width: 120,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Finalizar pedido',
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
