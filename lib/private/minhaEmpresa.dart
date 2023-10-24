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

import '../widget/meuPerfil.dart';
import '../widget/modalMeusCartoes.dart';

class MinhaEmpresaScreen extends StatefulWidget {
  MinhaEmpresaScreen({Key? key}) : super(key: key);

  @override
  State<MinhaEmpresaScreen> createState() => _MinhaEmpresaScreenState();
}

class _MinhaEmpresaScreenState extends State<MinhaEmpresaScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                  Text(
                    'Minha Empresa',
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Nome:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Cometa Eventos'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Site:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('www.cometaeven.com.br'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Endereço:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Rua Jasmin, 470'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email:'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('cometa.ev@gmail.com'),
                ],
              ),
            ],
          )),
        )));
  }
}
