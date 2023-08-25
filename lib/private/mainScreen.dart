import 'package:animated_toggle_switch/animated_toggle_switch.dart';
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Stack(alignment: Alignment.bottomLeft, children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/PericlesEx.png'),
                                ),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            width: 200,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 70,
                              width: 200,
                              child: Text(
                                'Churrasquinho Menos é Mais',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                        ]),
                        Stack(alignment: Alignment.bottomLeft, children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/PericlesEx.png'),
                                ),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            width: 200,
                          ),
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 70,
                              width: 200,
                              child: Text(
                                'Churrasquinho Menos é Mais',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ),
                        ]),
                      ],
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Stack(alignment: Alignment.bottomLeft, children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/PericlesEx.png'),
                                ),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            width: 120,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 70,
                              width: 100,
                              child: Text(
                                'Churrasquinho Menos é Mais',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(alignment: Alignment.bottomLeft, children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/PericlesEx.png'),
                                ),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            width: 120,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 70,
                              width: 100,
                              child: Text(
                                'Churrasquinho Menos é Mais',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(alignment: Alignment.bottomLeft, children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/PericlesEx.png'),
                                ),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                            width: 120,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.transparent, Colors.black]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 70,
                              width: 100,
                              child: Text(
                                'Churrasquinho Menos é Mais',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ]),
                      ],
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
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.green, Colors.blue]),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              height: 58,
                              width: 125,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.theater_comedy_rounded),
                                    Text(
                                      'Teatro',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    )
                                  ]),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.red, Colors.yellow]),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              height: 58,
                              width: 125,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.music_note),
                                    Text(
                                      'Shows',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
