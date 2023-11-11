import 'package:brasil_fields/brasil_fields.dart';
import 'package:dibs/models/clienteRegister.dart';
import 'package:dibs/repositories/autenticacao.dart';
import 'package:dibs/repositories/authentication-repository.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/service/colorService.dart';
import '../../main.dart';
import '../../shared/functions/utils.dart';
import '../../shared/service/textStyle.dart';
import '../../widget/buttonPadrao.dart';
import '../../widget/expandableTextField.dart';
import '../../widget/textfieldpadrao.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  int value = 0;
  TextEditingController primeiroNomeController = TextEditingController();
  TextEditingController sobrenomeNomeController = TextEditingController();
  TextEditingController cpfNomeController = TextEditingController();
  TextEditingController dataDeNascimentoNomeController =
      TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  DateTime? dataTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/signinBackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          icon: const Icon(FontAwesomeIcons.angleLeft)),
                      SvgPicture.asset("assets/images/logoDibs.svg")
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      'Cadastro',
                      style: TextStyleService(fontSize: 33).corSublinhadaSignIn,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Text(
                      'Colocar um texto aqui pra fazer marketing',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    children: [
                      Text(
                        'Primeiro nome',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      controller: primeiroNomeController,
                      height: 0.05,
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Sobrenome',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      controller: sobrenomeNomeController,
                      height: 0.05,
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'CPF',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      controller: cpfNomeController,
                      height: 0.05,
                      keyboardtype: TextInputType.number,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Data de nascimento',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      controller: dataDeNascimentoNomeController,
                      click: () async {
                        dataTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900, 1),
                          lastDate: DateTime.now(),
                        );
                        if (dataTime != null)
                          dataDeNascimentoNomeController.text =
                              formatDateTime(dataTime!);
                      },
                      height: 0.05,
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      controller: emailController,
                      height: 0.05,
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Telefone',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      keyboardtype: TextInputType.phone,
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      controller: telefoneController,
                      height: 0.05,
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Senha',
                        style: TextStyleService.labelSubtitle,
                      )
                    ],
                  ),
                  ExpandableTextField(
                      controller: senhaController,
                      height: 0.05,
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ButtonPadrao(
                      enable: true,
                      delete: false,
                      width: 0.5,
                      text: "Cadastre-se",
                      click: () async {
                        await LoginApi(dio).criarUsuario(ClientRegister(
                            login: emailController.text,
                            password: senhaController.text,
                            firstName: primeiroNomeController.text,
                            lastName: sobrenomeNomeController.text,
                            cpf: cpfNomeController.text,
                            birthDate: dataTime!,
                            phone: UtilBrasilFields.obterTelefone(
                                telefoneController.text,
                                mascara: false)));
                        ToastService.showToastInfo(
                            'Usuario criado com sucesso');
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Deseja cadastrar um evento?',
                            style: TextStyleService.defaultSignIn),
                        Text(
                          'Envie um email para o contato abaixo',
                          style: TextStyleService.defaultSignIn,
                        ),
                        InkWell(
                          onTap: () async {},
                          child: Text(
                            'contato@dibs.com.br',
                            style: TextStyleService.greenSignIn,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
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
