import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';

import '../widget/bannerCompraIngressoTerceiro.dart';
import 'infoPedidoScreen.dart';

class IngressosAnunciadosScreen extends StatefulWidget {
  const IngressosAnunciadosScreen({super.key});

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
        title: const Text(
          'Ingressos Anunciados',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Camarote - 4° Lote',
                    style: TextStyleService.corSublinhada),
                const Divider(),
                Column(
                    children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: BannerCompraIngressoTerceiro(
                        nome: 'Matheus Gomes',
                        tipoDoIngresso: 'Meia entrada',
                        valor: 'R\$ 200.00'),
                  );
                })),
                const SizedBox(
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xFF198A68),
                      ),
                      width: 120,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Comprar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
