import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';

class BannerCompraIngressoTerceiro extends StatefulWidget {
  String? tipoDoIngresso;
  String? valor;
  String? nome;
  BannerCompraIngressoTerceiro(
      {required this.tipoDoIngresso, required this.valor, required this.nome});

  @override
  State<BannerCompraIngressoTerceiro> createState() =>
      _BannerCompraIngressoTerceiroState();
}

class _BannerCompraIngressoTerceiroState
    extends State<BannerCompraIngressoTerceiro> {
  bool aberto = false;
  double quantidade = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [Text(widget.nome!), Icon(Icons.lock)],
                  ),
                  Text(widget.tipoDoIngresso!),
                  Text('R\$ 222,00')
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xFF198A68))),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        if (quantidade > 0) {
                          quantidade--;
                        }
                      }),
                      child: Container(
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        color: Color(0xFF198A68),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        child: Center(
                            child: Text(
                          quantidade.toInt().toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        height: 30,
                        width: 30,
                        color: Color(0xFF198A68).withOpacity(0.5),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        quantidade++;
                      }),
                      child: Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        height: 30,
                        width: 30,
                        color: Color(0xFF198A68),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
