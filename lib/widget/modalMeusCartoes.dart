import 'package:dibs/private/modalNovoCartao.dart';
import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import 'meuCartaoComponente.dart';

class ModalMeusCartoes extends StatelessWidget {
  ModalMeusCartoes();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Meus cartões',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                      children: List.generate(2, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: MeuCartaoComponente(
                          numero: substituirTresPrimeirosGruposPorAsteriscos(
                              "1234123412341234"),
                          tipo: "Crédito"),
                    );
                  })),
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
                      builder: (BuildContext context) {
                        return ModalNovoCartao();
                      },
                    );
                  },
                  child: Text(
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
