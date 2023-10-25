import 'package:dibs/widget/componenteGerenciadoDeLotes.dart';
import 'package:dibs/widget/modalEditar.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/modalTransferencia.dart';

class MeuEventoScreen extends StatelessWidget {
  MeuEventoScreen();

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
                            Text("10/10/2020"),
                            Icon(Icons.schedule),
                            Text('20:20')
                          ],
                        ),
                        Text(
                          'Churrasquinho menos é mais',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
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
                                            title: Text(
                                              'Editar evento',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            centerTitle: true,
                                            leading: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.black,
                                                )),
                                          ),
                                          body: SingleChildScrollView(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Foto de capa'),
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
                                                  Text('Titulo'),
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
                                                          Text('Data'),
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
                                                          Text('Horário'),
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
                                                  Text('Local'),
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
                                                  Text('Categoria'),
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
                                                  Text('Descrição'),
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
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        child: Center(
                                                          child: Text(
                                                            'Salvar',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          color:
                                                              Color(0xFF198A68),
                                                        ),
                                                        width: 140,
                                                        height: 40,
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
                                    child: Icon(Icons.edit),
                                  ),
                                ),
                                Padding(
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
                                            title: Text(
                                              'Gerenciar lotes',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            centerTitle: true,
                                            leading: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: Colors.black,
                                                )),
                                          ),
                                          body: SingleChildScrollView(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
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
                                                              padding: EdgeInsets
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
                                                                    Text(
                                                                      'Novo lote',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Divider(),
                                                                    Text(
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
                                                                            Text('Qntd. de ingressos'),
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
                                                                            Text('Preço'),
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
                                                                    Text(
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
                                                                    Text(
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
                                                                    SizedBox(
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
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              'Salvar',
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(7),
                                                                            color:
                                                                                Color(0xFF198A68),
                                                                          ),
                                                                          width:
                                                                              140,
                                                                          height:
                                                                              40,
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
                                                            child:
                                                                Icon(Icons.add),
                                                            height: 35,
                                                            width: 35,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey[300],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                          ),
                                                          Padding(
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
                                                    Divider(),
                                                    Text('Lotes Ativos'),
                                                    ComponenteGerenciadoDeLotes(),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    ComponenteGerenciadoDeLotes(),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text('Lotes Finalizados'),
                                                    ComponenteGerenciadoDeLotes(),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    ComponenteGerenciadoDeLotes(),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Center(
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          child: Center(
                                                            child: Text(
                                                              'Salvar',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color: Color(
                                                                0xFF198A68),
                                                          ),
                                                          width: 140,
                                                          height: 40,
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
                                    child: Icon(Icons.settings),
                                  ),
                                ),
                                Padding(
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
                        Text(
                          'Relatorio de venda',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
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
                              barRadius: Radius.circular(5),
                              percent: 0.8,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Color(0xFF198A68),
                              backgroundColor: Color(0xFFDADADA),
                            ),
                            Padding(
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
                              barRadius: Radius.circular(5),
                              percent: 0.4,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Color(0xFF10B981),
                              backgroundColor: Color(0xFFDADADA),
                            ),
                            Padding(
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
                              barRadius: Radius.circular(5),
                              percent: 0.8,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Color(0xFF198A68),
                              backgroundColor: Color(0xFFDADADA),
                            ),
                            Padding(
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
                              barRadius: Radius.circular(5),
                              percent: 0.4,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Color(0xFF10B981),
                              backgroundColor: Color(0xFFDADADA),
                            ),
                            Padding(
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
                          barRadius: Radius.circular(5),
                          percent: 0.849,
                          center: Text(
                            '849/1000',
                            style: TextStyle(color: Colors.white),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Color(0xFF198A68),
                          backgroundColor: Color(0xFFDADADA),
                        ),
                      ])),
              Container(
                decoration: BoxDecoration(
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
                    icon: Icon(Icons.arrow_back_ios),
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
