import 'package:dibs/private/ingressosAnunciados.dart';
import 'package:dibs/shared/functions/utils.dart';
import 'package:dibs/widget/bannerCompraIngresso.dart';
import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import 'infoPedidoScreen.dart';

class InfoIngressoScreen extends StatelessWidget {
  String? nomeDoEvento;
  String? data;
  String? hora;
  String? descricao;
  ImageProvider? fotoDoEvento;
  InfoIngressoScreen(
      {required this.nomeDoEvento,
      required this.data,
      required this.descricao,
      required this.fotoDoEvento,
      required this.hora});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 19,
                  right: 19),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [Icon(Icons.calendar_month), Text(data!)],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [Icon(Icons.schedule), Text(hora!)],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        nomeDoEvento!,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Text(limitTo14Words(descricao!)),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          useSafeArea: true,
                          builder: (context) => IngressosAnunciadosScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.confirmation_num,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Ver ingressos anunciados',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Camarote - 4° Lote',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  BannerCompraIngresso(
                      tipoDoIngresso: 'Inteira', valor: '20,00'),
                  BannerCompraIngresso(
                      tipoDoIngresso: 'Meia entrada', valor: '20,00'),
                  Row(
                    children: [
                      Text(
                        'Pista - 4° Lote',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                      children: List.generate(2, (index) {
                    return BannerCompraIngresso(
                        tipoDoIngresso: 'Inteira', valor: '540.00');
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(fit: BoxFit.cover, image: fotoDoEvento!),
              ),
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
