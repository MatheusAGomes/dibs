import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/private/modalMeusIngressosAnuncio.dart';
import 'package:dibs/widget/bannerCategoria.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/bannerSecundario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';

class AnuncieIngressoScreen extends StatefulWidget {
  AnuncieIngressoScreen({Key? key}) : super(key: key);

  @override
  State<AnuncieIngressoScreen> createState() => _AnuncieIngressoScreenState();
}

class _AnuncieIngressoScreenState extends State<AnuncieIngressoScreen> {
  @override
  void initState() {
    super.initState();
  }

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anuncie seu ingresso',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                    ),
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedToggleSwitch<int>.size(
                  current: value,
                  values: [0, 1],
                  height: 30,
                  indicatorSize: Size(130, 50),
                  indicatorColor: Colors.white,
                  innerColor: Colors.grey.shade300,
                  customIconBuilder: (context, local, global) {
                    if (local.value == 0)
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Meus anúncios',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      );
                    else
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Vendidos',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      );
                  },
                  indicatorBorderRadius: BorderRadius.circular(7),
                  borderColor: value.isEven
                      ? Colors.grey.shade300
                      : Colors.grey.shade300,
                  borderRadius: BorderRadiusDirectional.circular(9),
                  //colorBuilder: (i) => i.isEven ? Colors.grey : Colors.grey,
                  onChanged: (i) => setState(() => value = i),
                ),
                SizedBox(
                  height: 20,
                ),
                value == 0
                    ? Column(
                        children: [
                          InkWell(
                            onTap: () => showModalBottomSheet<void>(
                              isScrollControlled: true,
                              enableDrag: true,
                              isDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return ModalMeusIngressosAnuncio();
                              },
                            ),
                            child: Row(children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Novo anúncio',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            ]),
                          ),
                          Divider(),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: BannerMeuIgresso(
                                    empresa: false,
                                    anuncio: false,
                                    image: AssetImage(
                                        'assets/images/PericlesEx.png'),
                                    titulo: 'Churrasquinho menos é mais',
                                    data: '20/12/2020',
                                    hora: '19:00',
                                    lote: '1° Lote',
                                    tipo: 'Meia-Entrada',
                                    corBanner: Colors.green,
                                    corDoLote: Colors.green.shade900,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: BannerMeuIgresso(
                                    empresa: false,
                                    anuncio: false,
                                    image: AssetImage(
                                        'assets/images/PericlesEx.png'),
                                    titulo: 'Churrasquinho menos é mais',
                                    data: '20/12/2020',
                                    hora: '19:00',
                                    lote: '1° Lote',
                                    tipo: 'Meia-Entrada',
                                    corBanner: Colors.green,
                                    corDoLote: Colors.green.shade900,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
