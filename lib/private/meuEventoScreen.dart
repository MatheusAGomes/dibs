import 'package:dibs/private/editarEventoScreen.dart';
import 'package:dibs/private/gerenciarLote.dart';
import 'package:dibs/repositories/batch-repository.dart';
import 'package:dibs/repositories/events-repository.dart';
import 'package:dibs/widget/buttonCustomAction.dart';
import 'package:dibs/widget/componenteGerenciadoDeLotes.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../main.dart';
import '../models/batchReportIndex.dart';
import '../models/soldTickets.dart';
import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';

class MeuEventoScreen extends StatelessWidget {
  String? data;
  String? hora;
  String? nome;
  String? endereco;
  String? descricao;
  String? id;
  NetworkImage image;
  MeuEventoScreen(
      {required this.data,
      required this.descricao,
      required this.endereco,
      required this.hora,
      required this.id,
      required this.image,
      required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text(data ?? '',
                                    style: TextStyleService(fontSize: 15)
                                        .eventDateTime)
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
                                  child: Text(hora ?? ''!,
                                      style: TextStyleService(fontSize: 15)
                                          .eventDateTime),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              nome ?? '',
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
                            Text(endereco ?? '',
                                style: TextStyleService.eventLocal)
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015),
                        Row(
                          children: [
                            Text(limitTo14Words(descricao ?? ""),
                                textAlign: TextAlign.left,
                                style: TextStyle(letterSpacing: -0.41))
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonCustomAction(
                                text: 'Editar evento',
                                height: 40,
                                width: 40,
                                fontSize: 15,
                                click: () async {
                                  final a = await EventsRepository(dio)
                                      .getEvento(id!);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditarEventoScreen(
                                                id: id!,
                                                evento: a,
                                              )));
                                },
                                icon: Icon(FontAwesomeIcons.solidPenToSquare,
                                    size: 18)),
                            ButtonCustomAction(
                                text: 'Gerenciar Lotes',
                                height: 40,
                                width: 40,
                                fontSize: 15,
                                click: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GerenciarLoteScreen(
                                                  idDoEvento: id!)));
                                },
                                icon: Icon(FontAwesomeIcons.layerGroup,
                                    size: 18)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Color(0xFFD9D9D9),
                          thickness: 1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Relatório de venda',
                          style: TextStyleService.saleReport,
                        ),
                        FutureBuilder(
                          future: Future.wait([
                            BatchRepository(dio).getLoteAtivo(id),
                            BatchRepository(dio).getIngressosTotais(id)
                          ]),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<BatchReportIndex> lotes =
                                  snapshot.data![0] as List<BatchReportIndex>;
                              SoldTickets ingressosVendidos =
                                  snapshot.data![1] as SoldTickets;
                              if (lotes.isNotEmpty &&
                                  ingressosVendidos.totalTickets != 0)
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (lotes.isNotEmpty)
                                      Text(
                                        'Lotes ativos',
                                        style:
                                            TextStyleService.companyBatchStatus,
                                      ),
                                    Column(
                                      children: List.generate(
                                          lotes.length,
                                          (index) => Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    lotes[index].name,
                                                    style: TextStyleService
                                                        .companyBatch,
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.01),
                                                  LinearPercentIndicator(
                                                    padding: EdgeInsets.zero,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.875,
                                                    animation: true,
                                                    lineHeight: 23.0,
                                                    animationDuration: 1500,
                                                    barRadius:
                                                        const Radius.circular(
                                                            5),
                                                    percent: 0.8,
                                                    linearStrokeCap:
                                                        LinearStrokeCap
                                                            .roundAll,
                                                    progressColor:
                                                        const Color(0xFF198A68),
                                                    backgroundColor:
                                                        const Color(0x66DADADA),
                                                    center: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Inteira',
                                                            style: TextStyleService(
                                                                    color: Color(
                                                                        0xFFFFFFFF))
                                                                .companyBatchType,
                                                          ),
                                                          Text(
                                                              '${lotes[index].numberOfFullPriceTickets}/${lotes[index].numberOfFullPriceTicketsTotal}',
                                                              style: TextStyleService(
                                                                      color: Color(
                                                                          0xFF8D8D8D))
                                                                  .companyBatchAmount),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.005,
                                                  ),
                                                  LinearPercentIndicator(
                                                    padding: EdgeInsets.zero,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.875,
                                                    animation: true,
                                                    lineHeight: 23.0,
                                                    animationDuration: 1500,
                                                    barRadius:
                                                        const Radius.circular(
                                                            5),
                                                    percent: lotes[index]
                                                            .numberOfHalfPriceTickets /
                                                        lotes[index]
                                                            .numberOfHalfPriceTicketsTotal,
                                                    linearStrokeCap:
                                                        LinearStrokeCap
                                                            .roundAll,
                                                    progressColor:
                                                        const Color(0xFF10B981),
                                                    backgroundColor:
                                                        const Color(0x66DADADA),
                                                    center: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Meia',
                                                              style: TextStyleService(
                                                                      color: Color(
                                                                          0xFFFFFFFF))
                                                                  .companyBatchType),
                                                          Text(
                                                              '${lotes[index].numberOfHalfPriceTickets}/${lotes[index].numberOfHalfPriceTicketsTotal}',
                                                              style: TextStyleService(
                                                                      color: Color(
                                                                          0xFF8D8D8D))
                                                                  .companyBatchAmount),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.01,
                                                  ),
                                                ],
                                              )),
                                    ),
                                    Text(
                                      'Ingressos totais vendidos',
                                      style:
                                          TextStyleService.companyBatchStatus,
                                    ),
                                    LinearPercentIndicator(
                                      padding: EdgeInsets.zero,
                                      width: MediaQuery.of(context).size.width *
                                          0.875,
                                      animation: true,
                                      lineHeight: 23.0,
                                      animationDuration: 1500,
                                      barRadius: const Radius.circular(5),
                                      percent: ingressosVendidos.soldTickets /
                                          ingressosVendidos.totalTickets,
                                      center: Text(
                                          '${ingressosVendidos.soldTickets}/${ingressosVendidos.totalTickets}',
                                          style: TextStyleService(
                                                  color: Color(0xFF8D8D8D))
                                              .companyBatchAmount),
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor: const Color(0xFF198A68),
                                      backgroundColor: const Color(0x66DADADA),
                                    ),
                                  ],
                                );
                              else
                                return Center(
                                  child: Text('Sem dados sobre o evento'),
                                );
                            }
                            return SizedBox();
                          },
                        ),
                      ])),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover, image: image,
                    //  image: AssetImage('assets/images/PericlesEx.png')
                  ),
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
      ),
    );
  }
}
