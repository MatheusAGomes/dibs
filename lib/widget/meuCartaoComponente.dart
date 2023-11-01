import 'package:flutter/material.dart';

class MeuCartaoComponente extends StatelessWidget {
  String? numero;
  String? tipo;
  String? nome;
  bool? pedido;

  MeuCartaoComponente(
      {super.key,
      required this.numero,
      required this.tipo,
      required this.nome,
      required this.pedido});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(11)),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Icon(Icons.credit_card),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(numero!),
                      ],
                    ),
                    Text(
                      nome!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tipo!,
                      style: TextStyle(color: Colors.grey.shade500),
                    )
                  ],
                ),
                pedido! ? Icon(Icons.edit) : Icon(Icons.delete_outline_outlined)
            ]),
        ),
      ),
    );
  }
}
