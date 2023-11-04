import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/models/meuIngressoBanner.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MeusIngressosScreen extends StatefulWidget {
  MeusIngressosScreen({Key? key}) : super(key: key);

  @override
  State<MeusIngressosScreen> createState() => _MeusIngressosScreenState();
}

class _MeusIngressosScreenState extends State<MeusIngressosScreen> {
  @override
  void initState() {
    super.initState();
  }

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<MeuIngressoBanner>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> widgets = snapshot.data!.map((item) {
              if (item.valid) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BannerMeuIngresso(
                    id: item.id,
                    local: item.address,
                    ativo: item.valid,
                    empresa: false,
                    anuncio: false,
                    image: NetworkImage(item.picture ??
                        'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                    titulo: item.eventName,
                    data: item.startDate,
                    hora: item.time!,
                    lote: '1° Lote',
                    tipo: 'Meia-Entrada',
                    corBanner: Colors.green,
                    corDoLote: Colors.green.shade900,
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BannerMeuIngresso(
                    id: item.id,
                    local: item.address,
                    ativo: item.valid,
                    empresa: false,
                    anuncio: false,
                    image: NetworkImage(item.picture ??
                        'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                    titulo: item.eventName,
                    data: item.startDate,
                    hora: item.time!,
                    lote: '1° Lote',
                    tipo: 'Meia-Entrada',
                    corBanner: Colors.green,
                    corDoLote: Colors.green.shade900,
                  ),
                );
              }
            }).toList();
            return SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meus ingressos',
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
                              Text('Ativos',
                                  style: local.value.isEven
                                      ? TextStyleService.toggleSwitchActiveText
                                      : TextStyleService
                                          .toggleSwitchInactiveText),
                            ],
                          );
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Expirados',
                                  style: local.value.isEven
                                      ? TextStyleService
                                          .toggleSwitchInactiveText
                                      : TextStyleService
                                          .toggleSwitchActiveText),
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
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                if (snapshot.data![index].valid)
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: BannerMeuIngresso(
                                      id: snapshot.data![index].id,
                                      local: snapshot.data![index].address,
                                      ativo: snapshot.data![index].valid,
                                      empresa: false,
                                      anuncio: false,
                                      image: NetworkImage(snapshot
                                              .data![index].picture ??
                                          'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                                      titulo: snapshot.data![index].eventName,
                                      data: snapshot.data![index].startDate,
                                      hora: snapshot.data![index].time!,
                                      lote: '1° Lote',
                                      tipo: 'Meia-Entrada',
                                      corBanner: Colors.green,
                                      corDoLote: Colors.green.shade900,
                                    ),
                                  );
                              },
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                if (!snapshot.data![index].valid)
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: BannerMeuIngresso(
                                      id: snapshot.data![index].id,
                                      local: snapshot.data![index].address,
                                      ativo: snapshot.data![index].valid,
                                      empresa: false,
                                      anuncio: false,
                                      image: NetworkImage(snapshot
                                              .data![index].picture ??
                                          'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                                      titulo: snapshot.data![index].eventName,
                                      data: snapshot.data![index].startDate,
                                      hora: snapshot.data![index].time!,
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
              ),
            ));
          } else {
            return SizedBox();
          }
        },
        future: TicketRepository(dio).getTickets(),
      ),
    );
  }
}
