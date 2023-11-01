import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/main.dart';
import 'package:dibs/shared/enum/EventStatus.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
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
                  values: const [0, 1],
                  height: 30,
                  indicatorSize: const Size(130, 50),
                  indicatorColor: Colors.white,
                  innerColor: Colors.grey.shade300,
                  customIconBuilder: (context, local, global) {
                    if (local.value == 0) {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ativos',
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
                        return Scaffold(
                          appBar: AppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            title: Text(
                              'Novo evento',
                              style: TextStyle(color: Colors.black),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Foto de capa'),
                                  Container(
                                    height: 105,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                  ),
                                  const Text('Titulo'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Data'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
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
                                          Text('Horário'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: TextFieldPadrao(
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  const Text('Categoria'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  const Text('Descrição'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: const Color(0xFF198A68),
                                        ),
                                        width: 140,
                                        height: 40,
                                        child: const Center(
                                          child: Text(
                                            'Salvar',
                                            style:
                                                TextStyle(color: Colors.white),
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
                        height: MediaQuery.of(context).size.height,
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
                                        ativo: true,
                                        empresa: true,
                                        anuncio: false,
                                        image: const AssetImage(
                                            'assets/images/PericlesEx.png'),
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
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: BannerMeuIngresso(
                                        id: meusEventos![index].id!,
                                        local: meusEventos![index].address!,
                                        ativo: true,
                                        empresa: true,
                                        anuncio: false,
                                        image: const AssetImage(
                                            'assets/images/PericlesEx.png'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
