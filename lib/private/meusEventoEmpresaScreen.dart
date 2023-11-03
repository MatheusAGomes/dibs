import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/main.dart';
import 'package:dibs/shared/enum/EventStatus.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:dibs/widget/modalNovoEvento.dart';
import 'package:flutter/material.dart';

import '../models/events.dart';
import '../repositories/events-repository.dart';
import '../widget/textfieldpadrao.dart';

class MeusEventosEmpresasScreen extends StatefulWidget {
  const MeusEventosEmpresasScreen({Key? key}) : super(key: key);

  @override
  State<MeusEventosEmpresasScreen> createState() =>
      _MeusEventosEmpresasScreenState();
}

class _MeusEventosEmpresasScreenState extends State<MeusEventosEmpresasScreen> {
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meus Eventos',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
                    ),
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedToggleSwitch<int>.size(
                  current: value,
                  values: const [0, 1, 2],
                  height: 30,
                  indicatorSize: const Size(130, 50),
                  indicatorColor: Colors.white,
                  innerColor: Colors.grey.shade300,
                  customIconBuilder: (context, local, global) {
                    if (local.value == 0) {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Publicados',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      );
                    } else if (local.value == 1) {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Criados',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      );
                    } else {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Expirados',
                              style: TextStyle(fontWeight: FontWeight.w500)),
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
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 20,
                ),
                value == 0
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.55,
                        child: FutureBuilder<List<Events>>(
                            future: EventsRepository(dio).getMyEvents(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<Events> meusEventos = snapshot.data!
                                    .where((element) =>
                                        element.status ==
                                        EventStatusEnum.PUBLISHED)
                                    .toList();
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: meusEventos!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: BannerMeuIngresso(
                                        id: meusEventos![index].id!,
                                        local: meusEventos![index].address!,
                                        descricao:
                                            meusEventos![index].description,
                                        endereco: meusEventos![index].address,
                                        ativo: true,
                                        empresa: true,
                                        anuncio: false,
                                        image: NetworkImage(meusEventos[index]
                                                .picture ??
                                            'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                                        titulo: meusEventos![index].name!,
                                        data: meusEventos![index].startDate!,
                                        hora: meusEventos![index].time!,
                                        lote: '1° Lote',
                                        tipo: 'Meia-Entrada',
                                        corBanner: Colors.green,
                                        corDoLote: Colors.green.shade900,
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return SizedBox();
                              }
                            }),
                      )
                    : value == 1
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: FutureBuilder<List<Events>>(
                                future: EventsRepository(dio).getMyEvents(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Events> meusEventos = snapshot.data!
                                        .where((element) =>
                                            element.status ==
                                            EventStatusEnum.CREATED)
                                        .toList();
                                    return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: meusEventos!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: BannerMeuIngresso(
                                            descricao:
                                                meusEventos![index].description,
                                            endereco:
                                                meusEventos![index].address,
                                            id: meusEventos![index].id!,
                                            local: meusEventos![index].address!,
                                            ativo: true,
                                            empresa: true,
                                            anuncio: false,
                                            image: NetworkImage(meusEventos[
                                                        index]
                                                    .picture ??
                                                'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                                            titulo: meusEventos![index].name!,
                                            data:
                                                meusEventos![index].startDate!,
                                            hora: meusEventos![index].time!,
                                            lote: '1° Lote',
                                            tipo: 'Meia-Entrada',
                                            corBanner: Colors.green,
                                            corDoLote: Colors.green.shade900,
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                }),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.55,
                            child: FutureBuilder<List<Events>>(
                                future: EventsRepository(dio).getMyEvents(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Events> meusEventos = snapshot.data!
                                        .where((element) =>
                                            element.status ==
                                            EventStatusEnum.FINISHED)
                                        .toList();
                                    return ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: meusEventos!.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: BannerMeuIngresso(
                                            descricao:
                                                meusEventos![index].description,
                                            endereco:
                                                meusEventos![index].address,
                                            id: meusEventos![index].id!,
                                            local: meusEventos![index].address!,
                                            ativo: true,
                                            empresa: true,
                                            anuncio: false,
                                            image: NetworkImage(meusEventos[
                                                        index]
                                                    .picture ??
                                                'https://firebasestorage.googleapis.com/v0/b/dibs-67d1a.appspot.com/o/PericlesEx.png?alt=media&token=72406ea1-1582-4ad4-af59-5b2df066cb99&_gl=1*ly3jbo*_ga*MTczOTA4MjMwNi4xNjk4MTgwNTUy*_ga_CW55HF8NVT*MTY5ODk0MjAwNS40LjEuMTY5ODk0NjExNS41NS4wLjA'),
                                            titulo: meusEventos![index].name!,
                                            data:
                                                meusEventos![index].startDate!,
                                            hora: meusEventos![index].time!,
                                            lote: '1° Lote',
                                            tipo: 'Meia-Entrada',
                                            corBanner: Colors.green,
                                            corDoLote: Colors.green.shade900,
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                }),
                          )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
