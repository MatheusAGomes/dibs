import 'package:dibs/models/cards.dart';
import 'package:dibs/private/modalNovoCartao.dart';
import 'package:dibs/repositories/card-repository.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../shared/functions/utils.dart';
import 'meuCartaoComponente.dart';

class ModalMeusCartoes extends StatelessWidget {
  const ModalMeusCartoes({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Meus cartões',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      InkWell(
                        child: const Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<List<Cards>>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            children:
                                List.generate(snapshot.data!.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MeuCartaoComponente(
                                pedido: false,
                                nome: snapshot.data![index].name,
                                numero:
                                    substituirTresPrimeirosGruposPorAsteriscos(
                                        snapshot.data![index].number),
                                tipo: "Crédito"),
                          );
                        }));
                      }
                      return SizedBox();
                    },
                    future: CardRepository(dio).getCards(),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10)),
                      ),
                      builder: (BuildContext context) {
                        return const ModalNovoCartao();
                      },
                    );
                  },
                  child: const Text(
                    'Adicionar cartão',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
