import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/ticketReport.dart';
import '../repositories/batch-repository.dart';
import '../shared/service/colorService.dart';
import 'buttonPadrao.dart';

class ModalRegistroDeVenda extends StatelessWidget {
  TicketReport info;
  ModalRegistroDeVenda({required this.info});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Registro de Venda',
                    style: TextStyleService.modalTitle,
                  ),
                  InkWell(
                    child: Icon(FontAwesomeIcons.xmark, size: 18),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(
                color: Color(0x66000000),
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informações do Ingresso',
                      style: TextStyleService.labelSubtitle,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(info.eventName,
                            style: TextStyleService.defaultFieldLabel),
                        Row(
                          children: [
                            Text('${info.startDate}  ${info.time}',
                                style: TextStyleService.saleRecordDateTime)
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(info.halfPrice ? 'Meia-entrada' : 'Inteira',
                            style: TextStyleService(letterSpacing: -0.41)
                                .mediumSize13),
                        Text(info.address,
                            style: TextStyleService.defaultFieldLabel)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lote', style: TextStyleService.defaultFieldLabel),
                        Text('Preço', style: TextStyleService.defaultFieldLabel)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(info.batchName,
                            style: TextStyleService(letterSpacing: -0.41)
                                .mediumSize13),
                        Text(
                            info.halfPrice
                                ? 'R\$ ${(info.batchPrice / 2).toString()}'
                                : 'R\$ ${(info.batchPrice).toString()}',
                            style: TextStyleService(letterSpacing: -0.91)
                                .mediumSize13),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    Text(
                      'Informações da Transferência',
                      style: TextStyleService.labelSubtitle,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Transferido em',
                            style: TextStyleService.defaultFieldLabel),
                        Text('Valor',
                            style: TextStyleService.defaultFieldLabel),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${info.transferDate} ${info.transferTime}',
                            style: TextStyleService(letterSpacing: -0.91)
                                .mediumSize13),
                        Text('R\$ ${info.transferPrice}',
                            style: TextStyleService(letterSpacing: -0.91)
                                .mediumSize13)
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Anunciante',
                            style: TextStyleService.defaultFieldLabel),
                        Text('Comprador',
                            style: TextStyleService.defaultFieldLabel)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(info.advertiser,
                            style: TextStyleService(letterSpacing: -0.41)
                                .mediumSize13),
                        Text(info.buyer,
                            style: TextStyleService(letterSpacing: -0.41)
                                .mediumSize13)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(info.advertiserEmail,
                            style: TextStyleService(letterSpacing: -0.41)
                                .mediumSize13),
                        Text(info.buyerEmail,
                            style: TextStyleService(letterSpacing: -0.41)
                                .mediumSize13)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

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
