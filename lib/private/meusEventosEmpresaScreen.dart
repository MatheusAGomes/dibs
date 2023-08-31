import 'package:animated_toggle_switch/animated_toggle_switch.dart';
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

class MeusEventosEmpresaScreen extends StatefulWidget {
  MeusEventosEmpresaScreen({Key? key}) : super(key: key);

  @override
  State<MeusEventosEmpresaScreen> createState() =>
      _MeusEventosEmpresaScreenState();
}

class _MeusEventosEmpresaScreenState extends State<MeusEventosEmpresaScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                    'Meus Eventos',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(11),
                          color: Colors.grey.shade300,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 66,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 110,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.traffic_outlined,
                                              size: 40,
                                            ),
                                            Text(
                                              'Formula 1',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Aberto',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
