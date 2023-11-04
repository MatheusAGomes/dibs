import 'package:dibs/main.dart';
import 'package:dibs/models/newPassword.dart';
import 'package:dibs/private/categoriaScreen.dart';
import 'package:dibs/repositories/user-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import 'textfieldpadrao.dart';

class MeuPerfil extends StatefulWidget {
  @override
  State<MeuPerfil> createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  TextEditingController senhaController = TextEditingController();
  TextEditingController novaSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Meu perfil',
            style: TextStyleService.appBar,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.black,
              )),
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dados pessoais',
                    style: TextStyleService.labelSubtitle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nome',
                        style: TextStyleService.defaultFieldLabel,
                      ),
                      ExpandableTextField(
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidUser,
                            size: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sobrenome',
                        style: TextStyleService.defaultFieldLabel,
                      ),
                      ExpandableTextField(
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidUser,
                            size: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CPF',
                        style: TextStyleService.defaultFieldLabel,
                      ),
                      ExpandableTextField(
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidIdCard,
                            size: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data de nascimento',
                        style: TextStyleService.defaultFieldLabel,
                      ),
                      ExpandableTextField(
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.solidCalendar,
                            size: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyleService.defaultFieldLabel,
                      ),
                      ExpandableTextField(
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.at,
                            size: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Telefone',
                        style: TextStyleService.defaultFieldLabel,
                      ),
                      ExpandableTextField(
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.phone,
                            size: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  ButtonPadrao(
                    enable: true,
                    delete: false,
                    width: 0.5,
                    text: "Salvar",
                    click: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text(
                    'Alterar senha',
                    style: TextStyleService.labelSubtitle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Senha atual',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ExpandableTextField(
                          controller: senhaController,
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.lockOpen,
                            size: 18,
                          )),
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
                      ExpandableTextField(
                          controller: novaSenhaController,
                          click: () {},
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                            size: 18,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  ButtonPadrao(
                      enable: true,
                      delete: false,
                      width: 0.5,
                      text: "Alterar senha",
                      click: () async {
                        await UserRepository(dio).trocarSenha(NewPassword(
                            currentPassword: senhaController.text,
                            newPassword: novaSenhaController.text));
                        ToastService.showToastInfo(
                            'Senha alterada com sucesso');
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
