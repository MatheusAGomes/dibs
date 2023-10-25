import 'package:dibs/private/modalConfigAnuncio.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:flutter/material.dart';


class ModalMeusIngressosAnuncio extends StatefulWidget {
  const ModalMeusIngressosAnuncio({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Meus Ingressos',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
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
                                return const modalConfigAnuncio();
                              },
                            );
                          },
                          child: BannerMeuIngresso(
                            ativo: true,
                            empresa: false,
                            anuncio: true,
                            image: const AssetImage('assets/images/PericlesEx.png'),
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
