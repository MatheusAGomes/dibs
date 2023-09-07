import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class MeuCartaoComponente extends StatelessWidget {
  String? numero;
  String? tipo;

  MeuCartaoComponente({
    required this.numero,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(11)),
        height: 50,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(Icons.credit_card),
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
                  tipo!,
                  style: TextStyle(color: Colors.grey.shade500),
                )
              ],
            ),
            Icon(Icons.delete_outline_outlined)
          ]),
        ),
      ),
    );
  }
}
