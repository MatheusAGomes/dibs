import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';

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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [Icon(Icons.calendar_month), Text(data!)],
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
                  Text(descricao!),
                  Row(
                    children: [
                      Text(
                        'INGRESSOS',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Color(0xff6698D2),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.confirmation_num,
                                    size: 30,
                                  ),
                                  Text(
                                    'Inteira',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Text("R\$ 540.00")
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Color(0xff6698D2),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.23,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.confirmation_num,
                                    size: 30,
                                  ),
                                  Text(
                                    'Inteira',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Text("R\$ 540.00")
                          ]),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'MARKETPLACE',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                      children: List.generate(3, (index) {
                    return BannerIngressoMarketPlace(
                        tipoDoIngresso: 'Inteira', valor: '540.00');
                  })),
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
