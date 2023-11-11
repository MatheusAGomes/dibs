import 'package:brasil_fields/brasil_fields.dart';
import 'package:dibs/models/cardInput.dart';
import 'package:dibs/repositories/card-repository.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';
import '../widget/buttonPadrao.dart';
import '../widget/expandableTextField.dart';

class ModalNovoCartao extends StatefulWidget {
  const ModalNovoCartao({super.key});

  @override
  State<ModalNovoCartao> createState() => _ModalNovoCartaoState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();
TextEditingController cpfController = TextEditingController();
TextEditingController numeroController = TextEditingController();
TextEditingController cvcController = TextEditingController();
TextEditingController validadeController = TextEditingController();
DateTime? dataTime;

class _ModalNovoCartaoState extends State<ModalNovoCartao> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: (MediaQuery.of(context).viewInsets.bottom)),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Novo Cartão',
                          style: TextStyleService.modalTitle,
                        ),
                        InkWell(
                          child: Icon(FontAwesomeIcons.xmark, size: 18),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0x66000000),
                      thickness: 1,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Nome (como descrito no cartão)',
                              textAlign: TextAlign.left,
                              style: TextStyleService.defaultFieldLabel),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          ExpandableTextField(
                              controller: nomeController,
                              height: 0.06,
                              hintText: "ALUÍSIO ALBUQUERQUE",
                              prefixIcon: Icon(
                                FontAwesomeIcons.solidUser,
                                size: 16,
                              ))
                        ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('CPF',
                              textAlign: TextAlign.left,
                              style: TextStyleService.defaultFieldLabel),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          ExpandableTextField(
                              keyboardtype: TextInputType.number,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                CpfInputFormatter(),
                              ],
                              controller: cpfController,
                              height: 0.06,
                              hintText: "123.456.789-00",
                              prefixIcon: Icon(
                                FontAwesomeIcons.solidIdCard,
                                size: 16,
                              ))
                        ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Número do Cartão',
                              textAlign: TextAlign.left,
                              style: TextStyleService.defaultFieldLabel),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          ExpandableTextField(
                              keyboardtype: TextInputType.number,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                CartaoBancarioInputFormatter(),
                              ],
                              controller: numeroController,
                              height: 0.06,
                              hintText: "3454 9429 0482 4820",
                              prefixIcon: Icon(
                                FontAwesomeIcons.solidCreditCard,
                                size: 16,
                              ))
                        ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('CVV',
                                  textAlign: TextAlign.left,
                                  style: TextStyleService.defaultFieldLabel),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              ExpandableTextField(
                                  controller: cvcController,
                                  width: 0.42,
                                  height: 0.06,
                                  hintText: "***",
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.lock,
                                    size: 16,
                                  ))
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Expira em',
                                  textAlign: TextAlign.left,
                                  style: TextStyleService.defaultFieldLabel),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.005,
                              ),
                              ExpandableTextField(
                                  inputFormatter: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    ValidadeCartaoInputFormatter(),
                                  ],
                                  controller: validadeController,
                                  width: 0.42,
                                  height: 0.06,
                                  hintText: "03/29",
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.solidCreditCard,
                                    size: 16,
                                  ))
                            ]),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ],
                ),
                ButtonPadrao(
                    enable: true,
                    delete: false,
                    width: 0.45,
                    text: "Salvar",
                    click: () async {
                      await CardRepository(dio).criarCartao(CardInput(
                          number: UtilBrasilFields.removeCaracteres(
                              numeroController.text),
                          code: cvcController.text,
                          cpf: cpfController.text,
                          name: nomeController.text,
                          validity: validadeController.text));
                      ToastService.showToastInfo('Cartão criado');
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
