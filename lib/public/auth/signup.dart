import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';
import '../../widget/textfieldpadrao.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  int value = 0;
  TextEditingController usuarioController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter:
                ColorFilter.mode(Color(0xff7EF4D1), BlendMode.modulate),
            image: AssetImage("assets/images/loginPageImage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          icon: Icon(Icons.arrow_back_ios)),
                      Image.asset("assets/images/Dibs logo.png")
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'Cadastro',
                      style: TextStyle(
                          height: 1,
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          letterSpacing: -1.41,
                          shadows: <Shadow>[
                            Shadow(
                                offset: Offset(1.5, 1.5),
                                color: Color.fromRGBO(126, 244, 209, 0.72))
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Colocar um texto aqui pra fazer marketing',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Primeiro nome',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(11),
                      child: TextFieldPadrao(
                          // textFormFildKey: nomeKey,
                          // onchange: (p0) {
                          //   setState(() {});
                          //   nomeKey.currentState?.validate();
                          // },
                          validator: Validatorless.multiple([
                            Validatorless.required("Campo obrigatório"),
                            Validatorless.max(
                                255, "Número máximo de caracteres é 255")
                          ]),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical: 0),
                          // controller: nomeController,
                          enable: true,
                          click: () {
                            // setState(() {
                            //   alterado = true;
                            // });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sobrenome',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(11),
                      child: TextFieldPadrao(
                          // textFormFildKey: nomeKey,
                          // onchange: (p0) {
                          //   setState(() {});
                          //   nomeKey.currentState?.validate();
                          // },
                          validator: Validatorless.multiple([
                            Validatorless.required("Campo obrigatório"),
                            Validatorless.max(
                                255, "Número máximo de caracteres é 255")
                          ]),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical: 0),
                          // controller: nomeController,
                          enable: true,
                          click: () {
                            // setState(() {
                            //   alterado = true;
                            // });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        'CPF',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(11),
                      child: TextFieldPadrao(
                          // textFormFildKey: nomeKey,
                          // onchange: (p0) {
                          //   setState(() {});
                          //   nomeKey.currentState?.validate();
                          // },
                          validator: Validatorless.multiple([
                            Validatorless.required("Campo obrigatório"),
                            Validatorless.max(
                                255, "Número máximo de caracteres é 255")
                          ]),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical: 0),
                          // controller: nomeController,
                          enable: true,
                          click: () {
                            // setState(() {
                            //   alterado = true;
                            // });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        'Data de nascimento',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(11),
                      child: TextFieldPadrao(
                          // textFormFildKey: nomeKey,
                          // onchange: (p0) {
                          //   setState(() {});
                          //   nomeKey.currentState?.validate();
                          // },
                          validator: Validatorless.multiple([
                            Validatorless.required("Campo obrigatório"),
                            Validatorless.max(
                                255, "Número máximo de caracteres é 255")
                          ]),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical: 0),
                          // controller: nomeController,
                          enable: true,
                          click: () {
                            // setState(() {
                            //   alterado = true;
                            // });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(11),
                      child: TextFieldPadrao(
                          // textFormFildKey: nomeKey,
                          // onchange: (p0) {
                          //   setState(() {});
                          //   nomeKey.currentState?.validate();
                          // },
                          validator: Validatorless.multiple([
                            Validatorless.required("Campo obrigatório"),
                            Validatorless.max(
                                255, "Número máximo de caracteres é 255")
                          ]),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical: 0),
                          // controller: nomeController,
                          enable: true,
                          click: () {
                            // setState(() {
                            //   alterado = true;
                            // });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                        child: Center(
                          child: Text(
                            'Cadastar-se',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorService.verde,
                        ),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Deseja cadastrar um evento?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Envie um email para o contato abaixo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'contato@dibs.com.br',
                            style: TextStyle(
                                color: ColorService.verde,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
