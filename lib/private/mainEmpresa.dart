import 'dart:io';

import 'package:dibs/models/endereco.dart';
import 'package:dibs/models/eventInput.dart';
import 'package:dibs/repositories/batch-repository.dart';
import 'package:dibs/repositories/events-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/modalAjuda.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/auth.dart';
import '../models/batchReportIndex.dart';
import '../models/events.dart';
import '../models/soldTickets.dart';
import '../shared/enum/EvetnCategory.dart';
import '../shared/functions/utils.dart';
import '../widget/meuPerfil.dart';
import '../widget/modalMeusCartoes.dart';
import '../widget/modalNovoEvento.dart';
import '../widget/textfieldpadrao.dart';

class MainEmpresaScreen extends StatefulWidget {
  const MainEmpresaScreen({Key? key}) : super(key: key);

  @override
  State<MainEmpresaScreen> createState() => _MainEmpresaScreenState();
}

class _MainEmpresaScreenState extends State<MainEmpresaScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);

    buscaController.text;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset('assets/images/logoDibs.png'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: PopupMenuButton(
                  constraints: BoxConstraints.expand(width: 100, height: 120),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  icon: Icon(
                    Icons.menu_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'Ajuda':
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return ModalAjuda();
                          },
                        );
                        break;
                      default:
                    }
                  },
                  itemBuilder: (BuildContext bc) {
                    return [
                      const PopupMenuItem(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              FontAwesomeIcons.xmark,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 30,
                        value: 'Ajuda',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Ajuda",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () async {
                          auth.deslogar();
                        },
                        height: 30,
                        value: 'Sair',
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Sair",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ];
                  }),
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Olá, ${addEllipsis(auth.authDecoded!['login'].toString(), 15)}',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ], fontSize: 22)
                        .corSublinhada),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return ModalNovoEvento();
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5)),
                        height: 35,
                        width: 35,
                        child: const Icon(Icons.add),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Novo evento',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                FutureBuilder(
                  future: EventsRepository(dio).getNextEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Events evento = snapshot.data!;

                      return FutureBuilder(
                          future: Future.wait([
                            BatchRepository(dio)
                                .getLoteAtivo(snapshot.data!.id),
                            BatchRepository(dio)
                                .getIngressosTotais(snapshot.data!.id)
                          ]),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<BatchReportIndex> lotes =
                                  snapshot.data![0] as List<BatchReportIndex>;
                              SoldTickets ingressosVendidos =
                                  snapshot.data![1] as SoldTickets;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Proximo Evento',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Container(
                                    child: BannerPrincipal(
                                      empresa: true,
                                      id: evento.id!,
                                      height: 200,
                                      width: 400,
                                      image: NetworkImage(evento.picture!),
                                      titulo: evento.name!,
                                      data: evento.startDate!,
                                      hora: evento.time!,
                                      descricao: evento.description!,
                                      endereco: evento.address!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    'Lotes ativos',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
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
                                                      color: Colors.grey[700],
                                                      fontSize: 13),
                                                ),
                                                Stack(
                                                  children: [
                                                    LinearPercentIndicator(
                                                      padding: EdgeInsets.zero,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.875,
                                                      animation: true,
                                                      lineHeight: 20.0,
                                                      animationDuration: 2500,
                                                      barRadius:
                                                          const Radius.circular(
                                                              5),
                                                      percent: 0.8,
                                                      linearStrokeCap:
                                                          LinearStrokeCap
                                                              .roundAll,
                                                      progressColor:
                                                          const Color(
                                                              0xFF198A68),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFDADADA),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
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
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.005,
                                                ),
                                                Stack(
                                                  children: [
                                                    LinearPercentIndicator(
                                                      padding: EdgeInsets.zero,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.875,
                                                      animation: true,
                                                      lineHeight: 20.0,
                                                      animationDuration: 2500,
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
                                                          const Color(
                                                              0xFF10B981),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFDADADA),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
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
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                              ],
                                            )),
                                  ),
                                  Text(
                                    'Ingressos totais vendidos',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  LinearPercentIndicator(
                                    padding: EdgeInsets.zero,
                                    width: MediaQuery.of(context).size.width *
                                        0.875,
                                    animation: true,
                                    lineHeight: 20.0,
                                    animationDuration: 2500,
                                    barRadius: const Radius.circular(5),
                                    percent: ingressosVendidos.soldTickets /
                                        ingressosVendidos.totalTickets,
                                    center: Text(
                                      '${ingressosVendidos.soldTickets}/${ingressosVendidos.totalTickets}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: const Color(0xFF198A68),
                                    backgroundColor: const Color(0xFFDADADA),
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          });
                    } else {
                      return SizedBox();
                    }
                  },
                )
              ],
            )),
          ),
        ));
  }
}
