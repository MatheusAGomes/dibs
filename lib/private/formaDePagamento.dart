import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';
import '../widget/meuCartaoComponente.dart';
import 'modalNovoCartao.dart';

class FormaDePagamento extends StatefulWidget {
  const FormaDePagamento({super.key});

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
        centerTitle: true,
        title: const Text(
          'Forma de pagamento',
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
                const Text('Cartão', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return const ModalNovoCartao();
                        });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Novo Cartão',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Column(
                    children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: MeuCartaoComponente(
                        nome: 'Matheus Gomes',
                        numero: substituirTresPrimeirosGruposPorAsteriscos(
                            "1234123412341234"),
                        tipo: "Crédito"),
                  );
                })),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xFF198A68),
                      ),
                      width: 120,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'Continuar',
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
