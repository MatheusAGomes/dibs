import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';
import 'buttonPadrao.dart';
import 'expandableTextField.dart';

class ModalEditar extends StatelessWidget {
  ModalEditar();

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
                    'Editar Ingresso',
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
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Nome',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ExpandableTextField(
                        click: () {},
                        height: 0.06,
                        hintText: "Aluísio de Albuquerque",
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
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ButtonPadrao(
                  enable: true, delete: false,
                  width: 0.45, text: "Editar", click: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
