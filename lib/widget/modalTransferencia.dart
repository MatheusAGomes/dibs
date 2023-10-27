import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/colorService.dart';
import 'buttonPadrao.dart';
import 'expandableTextField.dart';

class ModalTransferencia extends StatelessWidget {
  ModalTransferencia();

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
                    'Transferir Ingresso',
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
                      'Insira o email da conta para a qual deseja transferir:',
                      textAlign: TextAlign.left,
                      style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ExpandableTextField(
                        click: () {},
                        height: 0.06,
                        hintText: "exemplo@email.com",
                        prefixIcon: Icon(
                          FontAwesomeIcons.at,
                          size: 16,
                        ))
                ]
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              ButtonPadrao(
                  enable: true, delete: false,
                  width: 0.45, text: "Transferir", click: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
