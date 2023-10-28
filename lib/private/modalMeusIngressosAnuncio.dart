import 'package:dibs/private/modalConfigAnuncio.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:flutter/material.dart';

import '../models/meuIngressoBanner.dart';
import '../widget/bannerCategoriaEvento.dart';

class ModalMeusIngressosAnuncio extends StatefulWidget {
  List<MeuIngressoBanner> meuIngressos;
  ModalMeusIngressosAnuncio({super.key, required this.meuIngressos});

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
                    itemCount: widget.meuIngressos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return modalConfigAnuncio(
                                    idDoEvento: widget.meuIngressos[index].id,
                                  );
                                },
                              );
                            },
                            child: BannerCategoriaEvento(
                              titulo: widget.meuIngressos[index].eventName,
                              corUm: Colors.green,
                              corDois: Colors.green,
                              data: widget.meuIngressos[index].startDate,
                              hora: widget.meuIngressos[index].time!,
                              image: AssetImage('assets/images/PericlesEx.png'),
                            )),
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
