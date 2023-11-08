import 'dart:io';

import 'package:dibs/models/endereco.dart';
import 'package:dibs/models/eventInput.dart';
import 'package:dibs/repositories/batch-repository.dart';
import 'package:dibs/repositories/events-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/buttonNewAction.dart';
import 'package:dibs/widget/modalAjuda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:
              SvgPicture.asset("assets/icons/dibsEmpresasLogo.svg", width: 85),
          titleSpacing: 21,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PopupMenuButton(
                  constraints: BoxConstraints.expand(width: 100, height: 120),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  icon: Icon(
                    FontAwesomeIcons.bars,
                    size: 22,
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
                    'Olá, ${addEllipsis(auth.authDecoded!['login'].toString(), 10)}',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ], fontSize: 22)
                        .corSublinhada),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ButtonNewAction(
                    text: 'Novo Evento',
                    click: () {
                      showModalBottomSheet<void>(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                        ),
                        builder: (BuildContext context) {
                          return ModalNovoEvento();
                        },
                      );
                    }),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Color(0xFFD9D9D9),
                  thickness: 1,
                ),
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
                                  Text('Próximo Evento',
                                      style:
                                          TextStyleService(fontSize: 22).bold),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
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
                                    style: TextStyleService.companyBatchStatus,
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.875,
                                                  animation: true,
                                                  lineHeight: 23.0,
                                                  animationDuration: 1500,
                                                  barRadius:
                                                      const Radius.circular(5),
                                                  percent:lotes[index]
                                                      .numberOfFullPriceTickets /
                                                      lotes[index]
                                                          .numberOfFullPriceTicketsTotal,
                                                  linearStrokeCap:
                                                      LinearStrokeCap.roundAll,
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
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.005,
                                                ),
                                                LinearPercentIndicator(
                                                  padding: EdgeInsets.zero,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.875,
                                                  animation: true,
                                                  lineHeight: 23.0,
                                                  animationDuration: 1500,
                                                  barRadius:
                                                      const Radius.circular(5),
                                                  percent: lotes[index]
                                                          .numberOfHalfPriceTickets /
                                                      lotes[index]
                                                          .numberOfHalfPriceTicketsTotal,
                                                  linearStrokeCap:
                                                      LinearStrokeCap.roundAll,
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
                                    style: TextStyleService.companyBatchStatus,
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
