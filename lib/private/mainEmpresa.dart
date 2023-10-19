import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerCategoria.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/bannerSecundario.dart';
import 'package:dibs/widget/modalAjuda.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';

import '../widget/modalPerfil.dart';
import '../widget/modalMeusCartoes.dart';

class MainEmpresaScreen extends StatefulWidget {
  MainEmpresaScreen({Key? key}) : super(key: key);

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
                  constraints:
                      const BoxConstraints.expand(width: 150, height: 170),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  icon: const Icon(
                    Icons.menu_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'MeuPerfil':
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return ModalPerfil();
                          },
                        );
                        break;

                      case 'MeusCartões':
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          enableDrag: true,
                          isDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return ModalMeusCartoes();
                          },
                        );
                        break;

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
                      PopupMenuItem(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Olá,{user}",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Meu perfil",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ],
                        ),
                        value: 'MeuPerfil',
                      ),
                      PopupMenuItem(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Meus cartões",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ],
                        ),
                        value: 'MeusCartões',
                      ),
                      PopupMenuItem(
                        height: 30,
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
                        value: 'Ajuda',
                      ),
                      PopupMenuItem(
                        height: 30,
                        child: Row(
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
                        value: 'Sair',
                      )
                    ];
                  }),
            )
          ],
          actionsIconTheme: IconThemeData(),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Olá,{Empresa}', style: TextStyleService.corSublinhada),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5)),
                        height: 35,
                        width: 35,
                        child: Icon(Icons.add),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Novo evento',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Divider(),
                Text('Proximo Evento',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  child: BannerPrincipal(
                    id: '1',
                    height: 200,
                    width: 400,
                    image: AssetImage('assets/images/PericlesEx.png'),
                    titulo: 'Churrasquinho Menos é Mais',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'Lotes ativos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  'Camarote - 4° Lote',
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Inteira',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('50/100',
                              style: TextStyle(color: Color(0xFF8D8D8D))),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Meia', style: TextStyle(color: Colors.white)),
                          Text('40/100',
                              style: TextStyle(color: Color(0xFF8D8D8D))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'Ingressos totais vendidos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
              ],
            )),
          ),
        ));
  }
}
