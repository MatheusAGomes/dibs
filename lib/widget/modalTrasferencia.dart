import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class ModalTransferencia extends StatelessWidget {
  ModalTransferencia();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transferir Ingresso',
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
              Divider(),
              Column(
                children: [
                  Text(
                      'Insira o email da conta para a qual deseja transferir:'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                      hintText: 'exemplo@email.com',
                      click: () {},
                      semMensagem: false,
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      filled: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: InkWell(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Transferir',
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
