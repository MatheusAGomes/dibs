import 'package:dibs/main.dart';
import 'package:dibs/models/cardSelect.dart';
import 'package:dibs/models/cards.dart';
import 'package:dibs/repositories/card-repository.dart';
import 'package:dibs/widget/buttonNewAction.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/functions/utils.dart';
import '../shared/service/textStyle.dart';
import '../widget/meuCartaoComponente.dart';
import 'modalNovoCartao.dart';

class FormaDePagamento extends StatefulWidget {
  FormaDePagamento({super.key});

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
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Formas de pagamento',
          style: TextStyleService.appBar,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.angleLeft,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cartão', style: TextStyleService.eventBatch),
                const SizedBox(
                  height: 10,
                ),
                ButtonNewAction(
                    text: 'Novo Cartão',
                    click: () async {
                      await showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                          ),
                          builder: (BuildContext context) {
                            return const ModalNovoCartao();
                          });
                      setState(() {});
                    }),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Color(0xFFD9D9D9),
                  thickness: 1,
                ),
                FutureBuilder(
                  future: CardRepository(dio).getCards(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          children:
                              List.generate(snapshot.data!.length, (index) {
                        // return Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 5),
                        //   child: MeuCartaoComponente(
                        //       pedido: true,
                        //       nome: snapshot.data![index].name,
                        //       numero: substituirTresPrimeirosGruposPorAsteriscos(
                        //           snapshot.data![index].number!),
                        //       tipo: "Cartão de Crédito"),
                        // );
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context, snapshot.data![index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MeuCartaoComponente(
                                pedido: true,
                                nome: snapshot.data![index].name,
                                numero:
                                    substituirTresPrimeirosGruposPorAsteriscos(
                                        snapshot.data![index].number),
                                tipo: "Crédito"),
                          ),
                        );
                      }));
                    }
                    return SizedBox();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonPadrao(
                    text: 'Continuar',
                    click: () {},
                    width: 0.5,
                    enable: true,
                    delete: false)
              ],
            ),
          )),
        ),
      ),
    );
  }
}
