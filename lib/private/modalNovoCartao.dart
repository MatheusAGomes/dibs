import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';
import '../widget/buttonPadrao.dart';
import '../widget/expandableTextField.dart';

class ModalNovoCartao extends StatefulWidget {
  ModalNovoCartao();

  @override
  State<ModalNovoCartao> createState() => _ModalNovoCartaoState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();

class _ModalNovoCartaoState extends State<ModalNovoCartao> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
        child: SingleChildScrollView(
          child: Column(
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
                    child: Icon(
                        FontAwesomeIcons.xmark,
                        size: 18),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Checkbox(
              //       fillColor: MaterialStateProperty.resolveWith((Set states){
              //         if(states.contains(MaterialState.selected)) {
              //           return ColorService.verde;
              //         }
              //           return Color(0x80198A68);
              //       }),
              //       // shape: OutlinedBorder
              //       value: checkboxValue,
              //       onChanged: (value) => setState(() {
              //         checkboxValue = value!;
              //       }),
              //     ),
              //     Text('Sou titular deste cartão')
              //   ],
              // ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Nome (como descrito no cartão)',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ExpandableTextField(
                        click: () {},
                        height: 0.06,
                        hintText: "ALUÍSIO ALBUQUERQUE",
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidUser,
                          size: 16,
                        ))
                  ]
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'CPF',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ExpandableTextField(
                        click: () {},
                        height: 0.06,
                        hintText: "123.456.789-00",
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidIdCard,
                          size: 16,
                        ))
                  ]
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Número do Cartão',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ExpandableTextField(
                        click: () {},
                        height: 0.06,
                        hintText: "3454 9429 0482 4820",
                        prefixIcon: Icon(
                          FontAwesomeIcons.solidCreditCard,
                          size: 16,
                        ))
                  ]
              ),
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
                        Text(
                            'CVV',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            click: () {},
                            width: 0.42,
                            height: 0.06,
                            hintText: "***",
                            prefixIcon: Icon(
                              FontAwesomeIcons.lock,
                              size: 16,
                            ))
                      ]
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Expira em',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            click: () {},
                            width: 0.42,
                            height: 0.06,
                            hintText: "03/29",
                            prefixIcon: Icon(
                              FontAwesomeIcons.solidCreditCard,
                              size: 16,
                            ))
                      ]
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ButtonPadrao(
                  enable: true, delete: false,
                  width: 0.45, text: "Salvar", click: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
