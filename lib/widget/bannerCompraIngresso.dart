import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';

class BannerCompraIngresso extends StatefulWidget {
  String? tipoDoIngresso;
  String? valor;
  BannerCompraIngresso({required this.tipoDoIngresso, required this.valor});

  @override
  State<BannerCompraIngresso> createState() => _BannerCompraIngressoState();
}

class _BannerCompraIngressoState extends State<BannerCompraIngresso> {
  bool aberto = false;
  double quantidade = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      color: Colors.white,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.tipoDoIngresso!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "R\$ ${widget.valor}",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => setState(() {
                      if (quantidade > 0) {
                        quantidade--;
                      }
                    }),
                    child: Container(
                      child: Icon(Icons.remove),
                      color: Colors.grey[300],
                      height: 30,
                      width: 30,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      child: Center(child: Text(quantidade.toInt().toString())),
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      quantidade++;
                    }),
                    child: Container(
                      child: Icon(Icons.add),
                      height: 30,
                      width: 30,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
