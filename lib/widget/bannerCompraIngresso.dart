import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BannerCompraIngresso extends StatefulWidget {
  String? tipoDoIngresso;
  int quantidade = 0;
  String? valor;
  VoidCallback add;
  VoidCallback less;
  BannerCompraIngresso(
      {super.key,
      required this.tipoDoIngresso,
      required this.quantidade,
      required this.valor,
      required this.add,
      required this.less});

  @override
  State<BannerCompraIngresso> createState() => _BannerCompraIngressoState();
}

class _BannerCompraIngressoState extends State<BannerCompraIngresso> {
  bool aberto = false;

  @override
  Widget build(BuildContext context) {
    return ShadowedCard(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.075,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.tipoDoIngresso!,
                    style: TextStyleService.ticketInput,
                  ),
                  Text(
                    "R\$ ${widget.valor}",
                    style: TextStyleService.ticketPrice,
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: Colors.grey.shade300,
                        width: 2)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.less();
                        setState(() {
                          if (widget.quantidade > 0) {
                            widget.quantidade--;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.grey.shade300),
                        height: 30,
                        width: 30,
                        child: const Icon(
                            FontAwesomeIcons.minus,
                            size: 18),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: 30,
                        width: 30,
                        color: Colors.white,
                        child: Center(
                            child: Text(
                                widget.quantidade.toInt().toString(),
                                style: TextStyleService.ticketInput)
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.add();
                        setState(() {
                          widget.quantidade++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.grey.shade300),
                        height: 30,
                        width: 30,
                        child: const Icon(
                            FontAwesomeIcons.plus,
                            size: 18),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
