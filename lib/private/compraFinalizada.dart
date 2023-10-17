import 'package:dibs/private/estruturaScreen.dart';
import 'package:dibs/private/formaDePagamento.dart';
import 'package:dibs/private/resumoDaCompra.dart';
import 'package:dibs/shared/routes/routes.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/modalEditar.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:validatorless/validatorless.dart';

import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/modalTrasferencia.dart';

class CompraFinalizada extends StatefulWidget {
  CompraFinalizada();

  @override
  State<CompraFinalizada> createState() => _CompraFinalizadaState();
}

class _CompraFinalizadaState extends State<CompraFinalizada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.grey,
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                child: Icon(
                  Icons.check_circle_outline_outlined,
                  color: Color(0xFF198A68),
                  size: 120,
                ),
              ),
              Text('Compra finalizada!'),
              Text('Pagamento realizado com sucesso.'),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 4,
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('Júlio Cesar Moura')],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 4,
                color: Colors.grey[200],
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.credit_card),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Crédito')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Subtotal'), Text("R\$ 540,00")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Desconto'), Text("R\$ 0,00")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "R\$ 540,00",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 4,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Impirmir comprovante')],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.MAINUSER);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 4,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Voltar para tela inicial')],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          )),
        ),
      ),
    );
  }
}
