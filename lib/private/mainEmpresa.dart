import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerCategoria.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/bannerSecundario.dart';
import 'package:dibs/widget/modalAjuda.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';

import '../widget/modalPerfil.dart';
import '../widget/modalMeusCartoes.dart';
import 'meusEventosEmpresaScreen.dart';
import 'minhaEmpresa.dart';

class MainEmpresa extends StatefulWidget {
  MainEmpresa({Key? key}) : super(key: key);

  @override
  State<MainEmpresa> createState() => _MainEmpresaState();
}

class _MainEmpresaState extends State<MainEmpresa> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logoDibs.png'),
              Text(
                'Empresa',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MinhaEmpresaScreen()));
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30,
                  )),
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Eventos',
                      style: TextStyleService.corSublinhada,
                    ),
                  ],
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MeusEventosEmpresaScreen()));
                        },
                        child: Text(
                          'Meus Eventos',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.grey.shade300)))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade300)),
                      onPressed: () {},
                      child: Text(
                        'Criar Evento',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Row(
                  children: [
                    Text(
                      'Ajuda',
                      style: TextStyleService.corSublinhada,
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade300)),
                      onPressed: () {},
                      child: Text(
                        'Contato',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sair',
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            )),
          ),
        ));
  }
}
