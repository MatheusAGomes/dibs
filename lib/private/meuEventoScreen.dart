import 'package:dibs/private/modalNovoLote.dart';
import 'package:dibs/repositories/batch-repository.dart';
import 'package:dibs/widget/componenteGerenciadoDeLotes.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../main.dart';
import '../models/batchReportIndex.dart';
import '../models/soldTickets.dart';
import '../shared/functions/utils.dart';

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
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Stack(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25,
                      left: 19,
                      right: 19),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text(data ?? ''),
                            Icon(Icons.schedule),
                            Text(hora ?? '')
                          ],
                        ),
                        Text(
                          nome ?? '',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(endereco ?? '')
                          ],
                        ),
                        Text((descricao ?? "")),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Scaffold(
                                          appBar: AppBar(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            title: const Text(
                                              'Editar evento',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            centerTitle: true,
                                            leading: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.black,
                                                )),
                                          ),
                                          body: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text('Foto de capa'),
                                                  Container(
                                                    height: 105,
                                                    width: 300,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1)),
                                                  ),
                                                  const Text('Titulo'),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    child: TextFieldPadrao(
                                                      click: () {},
                                                      enable: false,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text('Data'),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child:
                                                                TextFieldPadrao(
                                                              click: () {},
                                                              enable: false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text('Horário'),
                                                          SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.05,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                            child:
                                                                TextFieldPadrao(
                                                              click: () {},
                                                              enable: false,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const Text('Local'),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    child: TextFieldPadrao(
                                                      click: () {},
                                                      enable: false,
                                                    ),
                                                  ),
                                                  const Text('Categoria'),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    child: TextFieldPadrao(
                                                      click: () {},
                                                      enable: false,
                                                    ),
                                                  ),
                                                  const Text('Descrição'),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    child: TextFieldPadrao(
                                                      maxlength: 5,
                                                      click: () {},
                                                      enable: false,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color: const Color(
                                                              0xFF198A68),
                                                        ),
                                                        width: 140,
                                                        height: 40,
                                                        child: const Center(
                                                          child: Text(
                                                            'Salvar',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 35,
                                    width: 35,
                                    child: const Icon(Icons.edit),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Editar evento',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ModalNovoLote(idDoEvento: id!);
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 35,
                                    width: 35,
                                    child: const Icon(Icons.settings),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Gerenciar Lotes',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Relatorio de venda',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
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
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[600]),
                                                  ),
                                                  Stack(
                                                    children: [
                                                      LinearPercentIndicator(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.875,
                                                        animation: true,
                                                        lineHeight: 20.0,
                                                        animationDuration: 2500,
                                                        barRadius:
                                                            Radius.circular(5),
                                                        // percent: lotes[index]
                                                        //         .numberOfFullPriceTickets /
                                                        //     lotes[index]
                                                        //         .numberOfFullPriceTicketsTotal,
                                                        percent: 1,
                                                        linearStrokeCap:
                                                            LinearStrokeCap
                                                                .roundAll,
                                                        progressColor:
                                                            Color(0xFF198A68),
                                                        backgroundColor:
                                                            Color(0xFFDADADA),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 40),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Inteira',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                                '${lotes[index].numberOfFullPriceTickets}/${lotes[index].numberOfFullPriceTicketsTotal}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF8D8D8D))),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.005,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      LinearPercentIndicator(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.875,
                                                        animation: true,
                                                        lineHeight: 20.0,
                                                        animationDuration: 2500,
                                                        barRadius:
                                                            Radius.circular(5),
                                                        percent: lotes[index]
                                                                .numberOfHalfPriceTickets /
                                                            lotes[index]
                                                                .numberOfHalfPriceTicketsTotal,
                                                        linearStrokeCap:
                                                            LinearStrokeCap
                                                                .roundAll,
                                                        progressColor:
                                                            Color(0xFF10B981),
                                                        backgroundColor:
                                                            Color(0xFFDADADA),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 40),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('Meia',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                            Text(
                                                                '${lotes[index].numberOfHalfPriceTickets}/${lotes[index].numberOfHalfPriceTicketsTotal}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF8D8D8D))),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    if (ingressosVendidos.totalTickets != 0)
                                      Column(
                                        children: [
                                          Text(
                                            'Ingressos totais vendidos',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                          LinearPercentIndicator(
                                            padding: EdgeInsets.zero,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.875,
                                            animation: true,
                                            lineHeight: 20.0,
                                            animationDuration: 2500,
                                            barRadius: Radius.circular(5),
                                            percent: ingressosVendidos
                                                    .soldTickets /
                                                ingressosVendidos.totalTickets,
                                            center: Text(
                                              '${ingressosVendidos.soldTickets}/${ingressosVendidos.totalTickets}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            linearStrokeCap:
                                                LinearStrokeCap.roundAll,
                                            progressColor: Color(0xFF198A68),
                                            backgroundColor: Color(0xFFDADADA),
                                          ),
                                        ],
                                      )
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
                height: MediaQuery.of(context).size.height * 0.25,
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
