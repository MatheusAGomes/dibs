import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/models/events.dart';
import 'package:dibs/shared/enum/EventStatus.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerCategoria.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/bannerSecundario.dart';
import 'package:dibs/widget/modalAjuda.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';

import '../widget/meuPerfil.dart';
import '../widget/modalMeusCartoes.dart';

class MainScreen extends StatefulWidget {
  List<Events> listaDeEventos;
  MainScreen({super.key, required this.listaDeEventos});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);
    List<Events> listaFiltrada = widget.listaDeEventos
        .where((e) => e.status == EventStatusEnum.PUBLISHED)
        .toList();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: SvgPicture.asset("assets/images/logoDibs.svg", width: 85),
          titleSpacing: 21,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PopupMenuButton(
                  constraints:
                      const BoxConstraints.expand(width: 180, height: 170),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  icon: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.black,
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'MeuPerfil':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MeuPerfil()));
                        break;

                      case 'MeusCartões':
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          enableDrag: true,
                          isDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalMeusCartoes();
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
                              "Olá,${auth.authDecoded!['login'].toString()}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w900),
                            ),
                            const Icon(
                              Icons.person,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 30,
                        value: 'MeuPerfil',
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
                      ),
                      const PopupMenuItem(
                        height: 30,
                        value: 'MeusCartões',
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
                        height: 30,
                        value: 'Sair',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                auth.deslogar();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Sair",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      )
                    ];
                  }),
            )
          ],
          actionsIconTheme: const IconThemeData(),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 34,
                    width: 343,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      controller: buscaController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: 'Busque eventos',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.grey)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Eventos mais procurados',
                          style: TextStyleService(categoryShadow: <Shadow>[
                            Shadow(
                                offset: Offset(1.5, 1.5),
                                color: Color.fromRGBO(126, 244, 209, 0.72))
                          ], fontSize: 22).corSublinhada),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      itemCount: listaFiltrada.length,
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        return BannerPrincipal(
                          id: listaFiltrada[index].id!,
                          height: 230,
                          width: 200,
                          image:
                              const AssetImage('assets/images/PericlesEx.png'),
                          titulo: listaFiltrada[index].name!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Próximos a você',
                          style: TextStyleService(categoryShadow: <Shadow>[
                            Shadow(
                                offset: Offset(1.5, 1.5),
                                color: Color.fromRGBO(126, 244, 209, 0.72))
                          ], fontSize: 22).corSublinhada),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      itemCount: listaFiltrada.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return BannerSecundario(
                          id: listaFiltrada[index].id!,
                          image:
                              const AssetImage('assets/images/PericlesEx.png'),
                          titulo: listaFiltrada[index].name!,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Categorias',
                          style: TextStyleService(categoryShadow: <Shadow>[
                            Shadow(
                                offset: Offset(1.5, 1.5),
                                color: Color.fromRGBO(126, 244, 209, 0.72))
                          ], fontSize: 22).corSublinhada),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BannerCategoria(
                              icon: const Icon(
                                Icons.theater_comedy,
                                size: 35,
                              ),
                              titulo: 'Shows',
                              corUm: Colors.green,
                              corDois: Colors.blue),
                          BannerCategoria(
                              icon: const Icon(Icons.music_note),
                              titulo: 'Teatro',
                              corUm: Colors.red,
                              corDois: Colors.yellow),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BannerCategoria(
                              icon: const Icon(Icons.directions_walk),
                              titulo: 'Corridas',
                              corUm: Colors.pink.shade100,
                              corDois: Colors.pink.shade300),
                          BannerCategoria(
                              icon: const Icon(Icons.church),
                              titulo: 'Religioso',
                              corUm: Colors.green.shade200,
                              corDois: Colors.yellow),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
