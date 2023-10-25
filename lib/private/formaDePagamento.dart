import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/modalEditar.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/meuCartaoComponente.dart';
import '../widget/modalTransferencia.dart';
import 'modalNovoCartao.dart';

class FormaDePagamento extends StatefulWidget {
  FormaDePagamento();

  @override
  State<FormaDePagamento> createState() => _FormaDePagamentoState();
}

class _FormaDePagamentoState extends State<FormaDePagamento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Forma de pagamento',
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
                Text('Cartão', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return ModalNovoCartao();
                        });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3)),
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Novo Cartão',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Divider(),
                Column(
                    children: List.generate(2, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: MeuCartaoComponente(
                        nome: 'Matheus Gomes',
                        numero: substituirTresPrimeirosGruposPorAsteriscos(
                            "1234123412341234"),
                        tipo: "Crédito"),
                  );
                })),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      child: Center(
                        child: Text(
                          'Continuar',
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
