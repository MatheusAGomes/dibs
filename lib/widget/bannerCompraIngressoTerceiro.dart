import 'package:flutter/material.dart';


class BannerCompraIngressoTerceiro extends StatefulWidget {
  String? tipoDoIngresso;
  String? valor;
  String? nome;
  BannerCompraIngressoTerceiro(
      {super.key, required this.tipoDoIngresso, required this.valor, required this.nome});

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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [Text(widget.nome!), const Icon(Icons.lock)],
                  ),
                  Text(widget.tipoDoIngresso!),
                  const Text('R\$ 222,00')
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xFF198A68))),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        if (quantidade > 0) {
                          quantidade--;
                        }
                      }),
                      child: Container(
                        color: const Color(0xFF198A68),
                        height: 30,
                        width: 30,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFF198A68).withOpacity(0.5),
                        child: Center(
                            child: Text(
                          quantidade.toInt().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        quantidade++;
                      }),
                      child: Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFF198A68),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
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
