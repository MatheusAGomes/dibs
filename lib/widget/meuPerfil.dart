import 'package:brasil_fields/brasil_fields.dart';
import 'package:dibs/main.dart';
import 'package:dibs/models/clientInput.dart';
import 'package:dibs/models/newPassword.dart';
import 'package:dibs/private/categoriaScreen.dart';
import 'package:dibs/repositories/clients-repository.dart';
import 'package:dibs/repositories/user-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import 'textfieldpadrao.dart';

class MeuPerfil extends StatefulWidget {
  ClientInput cliente;
  MeuPerfil({required this.cliente});

  @override
  State<MeuPerfil> createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  TextEditingController senhaController = TextEditingController();
  TextEditingController novaSenhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  DateTime? dataTime;
  bool primeiravez = true;

  populando() {
    if (primeiravez) {
      nomeController.text = widget.cliente.firstName ?? "";
      sobrenomeController.text = widget.cliente.lastName ?? "";
      cpfController.text = widget.cliente.cpf != null
          ? UtilBrasilFields.obterCpf(widget.cliente.cpf!)
          : "";
      dataController.text = widget.cliente.birthDate != null
          ? formatDateTime(widget.cliente.birthDate!)
          : "";
      if (widget.cliente.birthDate != null) {
        dataTime = widget.cliente.birthDate;
      }
      telefoneController.text = widget.cliente.phone != null
          ? UtilBrasilFields.obterTelefone(widget.cliente.phone!)
          : "";
      primeiravez = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    populando();
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
                          controller: nomeController,
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
                          controller: sobrenomeController,
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
                          keyboardtype: TextInputType.number,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                          controller: cpfController,
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
                          controller: dataController,
                          click: () async {
                            dataTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900, 1),
                              lastDate: DateTime.now(),
                            );
                            if (dataTime != null)
                              dataController.text = formatDateTime(dataTime!);
                          },
                          height: 0.06,
                          prefixIcon: Icon(
                            FontAwesomeIcons.calendar,
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
                          keyboardtype: TextInputType.phone,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          controller: telefoneController,
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
                    click: () async {
                      await ClientsRepository(dio).putCLiente(ClientInput(
                          phone: UtilBrasilFields.obterTelefone(
                              telefoneController.text,
                              mascara: false),
                          cpf: cpfController.text,
                          firstName: nomeController.text,
                          lastName: sobrenomeController.text,
                          birthDate: dataTime));
                      ToastService.showToastInfo('Usuario editado');
                      Navigator.pop(context);
                    },
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
