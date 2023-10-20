import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class ModalEditar extends StatelessWidget {
  const ModalEditar({super.key});

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
                    'Editar ingresso',
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Nome'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CPF'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TextFieldPadrao(
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
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: ColorService.verde,
                    ),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Center(
                      child: Text(
                        'Editar',
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
