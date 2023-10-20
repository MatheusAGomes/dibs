import 'package:dibs/widget/componenteGerenciadoDeLotes.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../shared/functions/utils.dart';

class MeuEventoScreen extends StatelessWidget {
  const MeuEventoScreen({super.key});

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
                        const Row(
                          children: [
                            Icon(Icons.calendar_month),
                            Text("10/10/2020"),
                            Icon(Icons.schedule),
                            Text('20:20')
                          ],
                        ),
                        const Text(
                          'Churrasquinho menos é mais',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Row(
                          children: [
                            Icon(Icons.location_on),
                            Text('Campinas,São Paulo')
                          ],
                        ),
                        Text(limitTo14Words(
                            'Menos é mais novamente em Campinas para mais um show maravilhoso open bar e open food vai corinthians')),
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
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 20),
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
                                                          color:
                                                              const Color(0xFF198A68),
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
                                        return Scaffold(
                                          appBar: AppBar(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            title: const Text(
                                              'Gerenciar lotes',
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
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 20),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        showModalBottomSheet<
                                                            void>(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Padding(
                                                              padding: const EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          20,
                                                                      horizontal:
                                                                          20),
                                                              child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      'Novo lote',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    const Divider(),
                                                                    const Text(
                                                                        'Titulo'),
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.05,
                                                                      child:
                                                                          TextFieldPadrao(
                                                                        click:
                                                                            () {},
                                                                        enable:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const Text('Qntd. de ingressos'),
                                                                            SizedBox(
                                                                              height: MediaQuery.of(context).size.height * 0.05,
                                                                              width: MediaQuery.of(context).size.width * 0.4,
                                                                              child: TextFieldPadrao(
                                                                                click: () {},
                                                                                enable: false,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const Text('Preço'),
                                                                            SizedBox(
                                                                              height: MediaQuery.of(context).size.height * 0.05,
                                                                              width: MediaQuery.of(context).size.width * 0.4,
                                                                              child: TextFieldPadrao(
                                                                                click: () {},
                                                                                enable: false,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const Text(
                                                                        'Lote Programado'),
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.05,
                                                                      child:
                                                                          TextFieldPadrao(
                                                                        click:
                                                                            () {},
                                                                        enable:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    const Text(
                                                                        'Status'),
                                                                    SizedBox(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.05,
                                                                      child:
                                                                          TextFieldPadrao(
                                                                        click:
                                                                            () {},
                                                                        enable:
                                                                            false,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {},
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(7),
                                                                            color:
                                                                                const Color(0xFF198A68),
                                                                          ),
                                                                          width:
                                                                              140,
                                                                          height:
                                                                              40,
                                                                          child:
                                                                              const Center(
                                                                            child:
                                                                                Text(
                                                                              'Salvar',
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ]),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey[300],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child:
                                                                const Icon(Icons.add),
                                                          ),
                                                          const Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Text(
                                                                'Novo Lote'),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const Divider(),
                                                    const Text('Lotes Ativos'),
                                                    const ComponenteGerenciadoDeLotes(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const ComponenteGerenciadoDeLotes(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text('Lotes Finalizados'),
                                                    const ComponenteGerenciadoDeLotes(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const ComponenteGerenciadoDeLotes(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Center(
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
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
                                                  ]),
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
                        const Divider(),
                        const Text(
                          'Relatorio de venda',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          'Lotes ativos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'Camarotes - 4° Lote',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Stack(
                          children: [
                            LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width * 0.875,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              barRadius: const Radius.circular(5),
                              percent: 0.8,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: const Color(0xFF198A68),
                              backgroundColor: const Color(0xFFDADADA),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Inteira',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text('50/100',
                                      style:
                                          TextStyle(color: Color(0xFF8D8D8D))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Stack(
                          children: [
                            LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width * 0.875,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              barRadius: const Radius.circular(5),
                              percent: 0.4,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: const Color(0xFF10B981),
                              backgroundColor: const Color(0xFFDADADA),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Meia',
                                      style: TextStyle(color: Colors.white)),
                                  Text('40/100',
                                      style:
                                          TextStyle(color: Color(0xFF8D8D8D))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Pista - 4° lote',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Stack(
                          children: [
                            LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width * 0.875,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              barRadius: const Radius.circular(5),
                              percent: 0.8,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: const Color(0xFF198A68),
                              backgroundColor: const Color(0xFFDADADA),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Inteira',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text('50/100',
                                      style:
                                          TextStyle(color: Color(0xFF8D8D8D))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        Stack(
                          children: [
                            LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              width: MediaQuery.of(context).size.width * 0.875,
                              animation: true,
                              lineHeight: 20.0,
                              animationDuration: 2500,
                              barRadius: const Radius.circular(5),
                              percent: 0.4,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: const Color(0xFF10B981),
                              backgroundColor: const Color(0xFFDADADA),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Meia',
                                      style: TextStyle(color: Colors.white)),
                                  Text('40/100',
                                      style:
                                          TextStyle(color: Color(0xFF8D8D8D))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Text(
                          'Ingressos totais vendidos',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width * 0.875,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2500,
                          barRadius: const Radius.circular(5),
                          percent: 0.849,
                          center: const Text(
                            '849/1000',
                            style: TextStyle(color: Colors.white),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: const Color(0xFF198A68),
                          backgroundColor: const Color(0xFFDADADA),
                        ),
                      ])),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/PericlesEx.png')),
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
