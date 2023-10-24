import 'package:dibs/widget/modalEditar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/modalTrasferencia.dart';

class InfoMeuIngressoScreen extends StatelessWidget {
  String? nomeDoTitular;
  String? cpf;
  String? codigoDoIngresso;
  ImageProvider? fotoDoEvento;
  bool status;
  // bool anuncio;
  InfoMeuIngressoScreen(
      {required this.codigoDoIngresso,
      required this.cpf,
      required this.nomeDoTitular,
      required this.fotoDoEvento,
        // required this. anuncio,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.20,
                    left: 19,
                    right: 19),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          // QrImage(
                          //   data: codigoDoIngresso!,
                          //   version: QrVersions.auto,
                          //   size: 250.0,
                          // ),
                          Center(child: Text(codigoDoIngresso!)),
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'Titular',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(nomeDoTitular!),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'CPF',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(cpf!),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                 // trocar um dos dois para o de cancear
                 // anuncio ?
                 Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextButton(
                              onPressed: () {
                                if (status != true) {
                                  return;
                                }
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((context) =>
                                        ModalTransferencia()));
                              },
                              child: Text(
                                'Transferir',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      status
                                          ? Color(0xff198A68)
                                          : Colors.grey))),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      status
                                          ? Color(0xff198A68)
                                          : Colors.grey)),
                              onPressed: () {
                                if (status != true) {
                                  return;
                                }
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((context) => ModalEditar()));
                              },
                              child: Text(
                                'Editar',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ) ,
                 //     : Row(
                 //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                 //   children: [
                 //     SizedBox(
                 //       width: MediaQuery.of(context).size.width * 0.3,
                 //       child: TextButton(
                 //           onPressed: () {
                 //             if (status != true) {
                 //               return;
                 //             }
                 //             showModalBottomSheet(
                 //                 context: context,
                 //                 builder: ((context) =>
                 //                     ModalTransferencia()));
                 //           },
                 //           child: Text(
                 //             'Transferir',
                 //             style: TextStyle(color: Colors.white),
                 //           ),
                 //           style: ButtonStyle(
                 //               backgroundColor: MaterialStateProperty.all(
                 //                   status
                 //                       ? Color(0xff198A68)
                 //                       : Colors.grey))),
                 //     ),
                 //     SizedBox(
                 //       width: MediaQuery.of(context).size.width * 0.3,
                 //       child: TextButton(
                 //           style: ButtonStyle(
                 //               backgroundColor: MaterialStateProperty.all(
                 //                   status
                 //                       ? Color(0xff198A68)
                 //                       : Colors.grey)),
                 //           onPressed: () {
                 //             if (status != true) {
                 //               return;
                 //             }
                 //             showModalBottomSheet(
                 //                 context: context,
                 //                 builder: ((context) => ModalEditar()));
                 //           },
                 //           child: Text(
                 //             'Editar',
                 //             style: TextStyle(color: Colors.white),
                 //           )),
                 //     ),
                 //   ],
                 // ) ,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: fotoDoEvento!,
                  alignment: Alignment.topCenter),
              ),
              height: MediaQuery.of(context).size.height * 0.20,
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
