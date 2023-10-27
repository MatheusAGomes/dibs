import 'package:dibs/main.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class ModalTransferencia extends StatefulWidget {
  String id;
  ModalTransferencia({required this.id});

  @override
  State<ModalTransferencia> createState() => _ModalTransferenciaState();
}

class _ModalTransferenciaState extends State<ModalTransferencia> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transferir Ingresso',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                  InkWell(
                    child: const Icon(Icons.close),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  const Text(
                      'Insira o email da conta para a qual deseja transferir:'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
                        controller: email,
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
              Center(
                child: InkWell(
                  onTap: () async {
                    await TicketRepository(dio)
                        .transferTicket(widget.id, email.text)
                        .whenComplete(() {
                      ToastService.showToastInfo('Ingresso transferido');
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorService.verde,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Center(
                      child: Text(
                        'Transferir',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
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
