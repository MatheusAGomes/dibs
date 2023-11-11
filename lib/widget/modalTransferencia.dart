import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/auth.dart';
import '../models/modeloRespostaEditTicket.dart';
import '../shared/service/colorService.dart';
import 'buttonPadrao.dart';
import 'expandableTextField.dart';

class ModalTransferencia extends StatelessWidget {
  String id;
  ModalTransferencia({required this.id});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Transferir Ingresso',
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
                          controller: emailController,
                          height: 0.06,
                          hintText: "exemplo@email.com",
                          prefixIcon: Icon(
                            FontAwesomeIcons.at,
                            size: 16,
                          ))
                    ]),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                ButtonPadrao(
                    enable: true,
                    delete: false,
                    width: 0.45,
                    text: "Transferir",
                    click: () async {
                      await TicketRepository(dio)
                          .transferTicket(id, emailController.text);
                      ToastService.showToastInfo('Ingresso transferido');
                      Navigator.pop(context);
                      // Navigator.pop(context);
                      auth.gambiarraMonstra();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
