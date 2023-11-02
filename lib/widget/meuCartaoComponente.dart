import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/textStyle.dart';

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
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0x40000000)),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
                color: Color(0x40000000),
                offset: Offset(2,2),
                blurRadius: 0.2
            )
          ]
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            // height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    pedido! ? Padding(
                        padding: EdgeInsetsDirectional.only(end: 15),
                        // padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                        child: SizedBox(
                            width: 30,
                            child: Checkbox(value: false, onChanged: (bool? value) {})
                        ))
                    : Padding(
                        padding: EdgeInsetsDirectional.only(start: 5, end: 20),
                        child: Icon(
                          FontAwesomeIcons.solidCreditCard,
                          size: 22,
                        )),
                    Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(numero!,
                                  style: TextStyleService(
                                    fontSize: 14,
                                    color: Colors.black).creditCardComponent),
                              ],
                            ),
                            Text(
                              nome!.toUpperCase(),
                              style: TextStyleService(
                                fontSize: 11,
                                color: Colors.black).creditCardComponent,
                            ),
                            Text(
                              tipo!,
                              style: TextStyleService(
                                  fontSize: 11,
                                  color: Color(0xFFB3B0B0)).creditCardComponent,
                            )
                          ],
                        )
                    )
                  ],
                ),
                pedido! ? SizedBox()
                : InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                        BorderRadius.circular(5)),
                    height: 35,
                    width: 35,
                    child: Icon(FontAwesomeIcons.solidTrashCan,
                        size: 18,
                        color: Color(0xFFFB6464)),
                  ),
                ),
                // Icon(
                //     FontAwesomeIcons.solidPenToSquare,
                //     size: 20)
              ],
            ),
          ),
        ),
      ),
    );
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
