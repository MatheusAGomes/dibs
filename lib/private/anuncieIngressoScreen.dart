import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/private/modalMeusIngressosAnuncio.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerCategoria.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/bannerSecundario.dart';
import 'package:dibs/widget/buttonNewAction.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';
import '../main.dart';
import '../models/meuIngressoBanner.dart';
import '../repositories/ticket-repository.dart';

class AnuncieIngressoScreen extends StatefulWidget {
  List<MeuIngressoBanner> meusingressosavenda;
  List<MeuIngressoBanner> meusIngressosVendidos;
  AnuncieIngressoScreen(
      {required this.meusingressosavenda, required this.meusIngressosVendidos});

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
    List<MeuIngressoBanner> meusingressosavenda = widget.meusingressosavenda
        .where(
          (element) => element.forSale,
        )
        .toList();
    List<MeuIngressoBanner> meusingressosparavender = widget.meusingressosavenda
        .where(
          (element) => element.forSale == false,
        )
        .toList();
    List<MeuIngressoBanner> meusIngressosVendidos =
        widget.meusIngressosVendidos;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
          child: SingleChildScrollView(
            // scrollDirection: null,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anuncie seu ingresso',
                      style: TextStyleService.boldSpacing141,
                    ),
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                AnimatedToggleSwitch<int>.size(
                  current: value,
                  values: [0, 1],
                  height: 30,
                  indicatorSize: Size(150, 50),
                  indicatorColor: Colors.white,
                  innerColor: Colors.grey.shade300,
                  customIconBuilder: (context, local, global) {
                    if (local.value == 0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Meus anúncios',
                              style: local.value.isEven
                                  ? TextStyleService.toggleSwitchActiveText
                                  : TextStyleService.toggleSwitchInactiveText),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Vendidos',
                              style: local.value.isEven
                                  ? TextStyleService.toggleSwitchInactiveText
                                  : TextStyleService.toggleSwitchActiveText),
                        ],
                      );
                    }
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
                          ButtonNewAction(
                              text: 'Novo Anúncio',
                              click: () async {
                                List<MeuIngressoBanner> a =
                                    await TicketRepository(dio).getTickets();
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  context: context,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                  ),
                                  builder: (BuildContext context) {
                                    return ModalMeusIngressosAnuncio(
                                      meuIngressos: meusingressosparavender,
                                    );
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
                          Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: meusingressosavenda.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: BannerMeuIngresso(
                                    id: meusingressosavenda[index].id,
                                    local: meusingressosavenda[index].address,
                                    ativo: meusingressosavenda[index].valid,
                                    empresa: false,
                                    anuncio: true,
                                    image: NetworkImage(meusingressosavenda[
                                                index]
                                            .picture ??
                                        'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                                    titulo:
                                        meusingressosavenda[index].eventName,
                                    data: meusingressosavenda[index].startDate,
                                    hora: meusingressosavenda[index].time!,
                                    lote: 'Lote',
                                    tipo: 'Meia Entrada',
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
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: meusIngressosVendidos!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: BannerMeuIngresso(
                                    vendidos: true,
                                    id: meusIngressosVendidos[index].id,
                                    local: meusIngressosVendidos[index].address,
                                    ativo: meusIngressosVendidos[index].valid,
                                    empresa: false,
                                    anuncio: true,
                                    image: NetworkImage(meusIngressosVendidos[
                                                index]
                                            .picture ??
                                        'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                                    titulo:
                                        meusIngressosVendidos[index].eventName,
                                    data:
                                        meusIngressosVendidos[index].startDate,
                                    hora: meusIngressosVendidos[index].time!,
                                    lote: 'Lote',
                                    tipo: 'Meia Entrada',
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
