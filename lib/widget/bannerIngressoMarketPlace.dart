import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class BannerIngressoMarketPlace extends StatelessWidget {
  String? tipoDoIngresso;
  String? valor;
  BannerIngressoMarketPlace(
      {required this.tipoDoIngresso, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Color(0xffFF8A65),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.23,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.confirmation_num,
                  size: 30,
                ),
                Text(
                  tipoDoIngresso!,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
                ),
              ],
            ),
          ),
          Text("R\$ $valor")
        ]),
      ),
    );
  }
}
