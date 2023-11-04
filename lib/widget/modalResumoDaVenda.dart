import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/ticketReport.dart';
import '../shared/service/colorService.dart';
import 'buttonPadrao.dart';
import 'expandableTextField.dart';

class ModalResumoDaVenda extends StatelessWidget {
  TicketReport info;
  ModalResumoDaVenda({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Resumo da venda',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informações do Ingresso',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(info.eventName),
                    Row(
                      children: [Text('${info.startDate} ${info.time}')],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(info.halfPrice ? 'Meia-entrada' : 'Inteira'),
                    Text(info.address)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Lote'), Text('Preço')],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(info.batchName),
                    Text(info.halfPrice
                        ? 'R\$ ${(info.batchPrice / 2).toString()}'
                        : 'R\$ ${(info.batchPrice).toString()}'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Informações da Transferência',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transferido em'),
                    Text('Valor'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${info.transferDate} ${info.transferTime}'),
                    Text('R\$ ${info.transferPrice}')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Anunciante',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Comprador',
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(info.advertiser), Text(info.buyer)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(info.advertiserEmail), Text(info.buyerEmail)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
