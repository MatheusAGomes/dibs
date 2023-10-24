import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';
import '../widget/bannerCompraIngressoTerceiro.dart';
import '../widget/meuCartaoComponente.dart';
import 'infoPedidoScreen.dart';
import 'modalNovoCartao.dart';

class IngressosAnunciadosScreen extends StatefulWidget {
  IngressosAnunciadosScreen();

  @override
  State<IngressosAnunciadosScreen> createState() =>
      _IngressosAnunciadosScreenState();
}

class _IngressosAnunciadosScreenState extends State<IngressosAnunciadosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Ingressos Anunciados',
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
                Text('Camarote - 4° Lote',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ]).corSublinhada),
                Divider(),
                Column(
                    children: List.generate(2, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: BannerCompraIngressoTerceiro(
                        nome: 'Matheus Gomes',
                        tipoDoIngresso: 'Meia entrada',
                        valor: 'R\$ 200.00'),
                  );
                })),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoPedidoScreen(
                                    numero: 2,
                                  )));
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          'Comprar',
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
