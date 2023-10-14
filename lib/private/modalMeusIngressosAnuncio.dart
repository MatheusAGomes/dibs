import 'package:dibs/private/modalConfigAnuncio.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';

class ModalMeusIngressosAnuncio extends StatefulWidget {
  ModalMeusIngressosAnuncio();

  @override
  State<ModalMeusIngressosAnuncio> createState() =>
      _ModalMeusIngressosAnuncioState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();

class _ModalMeusIngressosAnuncioState extends State<ModalMeusIngressosAnuncio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meus Ingressos',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    InkWell(
                      child: Icon(Icons.close),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.67,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return modalConfigAnuncio();
                              },
                            );
                          },
                          child: BannerMeuIgresso(
                            empresa: false,
                            anuncio: true,
                            image: AssetImage('assets/images/PericlesEx.png'),
                            titulo: 'Churrasquinho menos é mais',
                            data: '20/12/2020',
                            hora: '19:00',
                            lote: '1° Lote',
                            tipo: 'Meia-Entrada',
                            corBanner: Colors.green,
                            corDoLote: Colors.green.shade900,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
