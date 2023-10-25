import 'package:dibs/private/formaDePagamento.dart';
import 'package:dibs/private/resumoDaCompra.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/modalEditar.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/modalTransferencia.dart';

class InfoPedidoScreen extends StatefulWidget {
  int numero;
  InfoPedidoScreen({required this.numero});

  @override
  State<InfoPedidoScreen> createState() => _InfoPedidoScreenState();
}

class _InfoPedidoScreenState extends State<InfoPedidoScreen> {
  TextEditingController nomeController = TextEditingController();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Pedido',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informações dos ingressos',
                  style: TextStyleService(categoryShadow: <Shadow>[
                    Shadow(
                        offset: Offset(1.5, 1.5),
                        color: Color.fromRGBO(126, 244, 209, 0.72))
                  ]).corSublinhada
                ),
                Text('Camarote - 4° lote',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  'Inteira - R\$ 400,00',
                  style: TextStyle(color: Colors.grey),
                ),
                Text('Nome'),
                SizedBox(
                  height: 35,
                  child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Aluísio de Albuquerque",
                      // textFormFildKey: nomeKey,
                      // onchange: (p0) {
                      //   setState(() {});
                      //   nomeKey.currentState?.validate();
                      // },
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ]),
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                          vertical: 0),
                      controller: nomeController,
                      enable: true,
                      click: () {
                        // setState(() {
                        //   alterado = true;
                        // });
                      }),
                ),
                Text('CPF'),
                SizedBox(
                  height: 35,
                  child: TextFieldPadrao(
                      prefixIcon: Icon(Icons.badge),
                      hintText: "111.111.111-11",
                      // textFormFildKey: nomeKey,
                      // onchange: (p0) {
                      //   setState(() {});
                      //   nomeKey.currentState?.validate();
                      // },
                      validator: Validatorless.multiple([
                        Validatorless.required("Campo obrigatório"),
                        Validatorless.max(
                            255, "Número máximo de caracteres é 255")
                      ]),
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                          vertical: 0),
                      // controller: nomeController,
                      enable: true,
                      click: () {
                        // setState(() {
                        //   alterado = true;
                        // });
                      }),
                ),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(Color(0xFF198A68)),
                      value: checkboxValue,
                      onChanged: (value) => setState(() {
                        checkboxValue = value!;
                      }),
                    ),
                    Text('Sou titular deste cartão')
                  ],
                ),
                Text(
                  'Forma de pagamento',
                  style: TextStyleService(categoryShadow: <Shadow>[
                    Shadow(
                        offset: Offset(1.5, 1.5),
                        color: Color.fromRGBO(126, 244, 209, 0.72))
                  ]).corSublinhada
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => FormaDePagamento(),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Cartão de Crédito',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.edit),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResumoDaCompra()));
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Avançar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFF198A68),
                      ),
                      width: 120,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
