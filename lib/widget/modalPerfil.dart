import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';
import 'textfieldpadrao.dart';

class ModalPerfil extends StatelessWidget {
  ModalPerfil();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Meu perfil',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'Dados Pessoais',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sobrenome',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CPF',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data de nascimento',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Telefone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorService.verde,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                'Alterar senha',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Senha atual',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nova senha',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        // textFormFildKey: nomeKey,
                        // onchange: (p0) {
                        //   setState(() {});
                        //   nomeKey.currentState?.validate();
                        // },
                        // validator: Validatorless.multiple([
                        //   Validatorless.required("Campo obrigatório"),
                        //   Validatorless.max(
                        //       255, "Número máximo de caracteres é 255")
                        // ]),
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
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Center(
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Alterar senha',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorService.verde,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
