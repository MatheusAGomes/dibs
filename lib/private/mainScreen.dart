import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/widget/bannerCategoria.dart';
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

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/logoDibs.png'),
                      Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 34,
                    width: 343,
                    child: TextFormField(
                      cursorColor: Colors.grey,
                      controller: buscaController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Busque eventos',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey.shade300)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(children: [
                    Positioned(
                      right: 69,
                      child: Row(
                        children: [
                          Text(
                            'Eventos mais procurados',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Color(0xff7EF4D1)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Eventos mais procurados',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 230,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return BannerPrincipal(
                          image: AssetImage('assets/images/PericlesEx.png'),
                          titulo: 'Churrasquinho Menos é Mais',
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(children: [
                    Positioned(
                      right: 143,
                      child: Row(
                        children: [
                          Text(
                            'Próximos a você',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Color(0xff7EF4D1)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Próximos a você',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: BannerSecundario(
                            image: AssetImage('assets/images/PericlesEx.png'),
                            titulo: 'Churrasquinho Menos é Mais',
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(children: [
                    Positioned(
                      right: 189,
                      child: Row(
                        children: [
                          Text(
                            'Categorias',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Color(0xff7EF4D1)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Categorias',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BannerCategoria(
                              icon: Icon(Icons.theater_comedy),
                              titulo: 'Shows',
                              corUm: Colors.green,
                              corDois: Colors.blue),
                          BannerCategoria(
                              icon: Icon(Icons.music_note),
                              titulo: 'Teatro',
                              corUm: Colors.red,
                              corDois: Colors.yellow),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BannerCategoria(
                              icon: Icon(Icons.directions_walk),
                              titulo: 'Corridas',
                              corUm: Colors.pink.shade100,
                              corDois: Colors.pink.shade300),
                          BannerCategoria(
                              icon: Icon(Icons.church),
                              titulo: 'Teatro',
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
