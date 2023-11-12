import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BannerCompraIngressoTerceiro extends StatefulWidget {
  String? tipoDoIngresso;
  String? valor;
  String? nome;
  int? quantidadeDisponivel;
  VoidCallback add;
  VoidCallback less;
  BannerCompraIngressoTerceiro(
      {super.key,
      required this.add,
      required this.less,
      required this.tipoDoIngresso,
      required this.valor,
      required this.nome,
      required this.quantidadeDisponivel});

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
    return ShadowedCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 5),
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.nome!,
                          style: TextStyleService.ticketSellerName
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      SvgPicture.asset(
                          'assets/icons/SecureResaleIcon.svg',
                          width: 17),
                    ],
                  ),
                  Text(
                      widget.tipoDoIngresso!,
                      style: TextStyleService.ticketMarketplace
                  ),
                  Text(
                      widget.valor!,
                      style: TextStyleService.ticketMarketplace
                  ),
                  Text(
                      'Qnt. disponivel: ${widget.quantidadeDisponivel}',
                      style: TextStyleService.ticketMarketplaceSemibold
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color(0xFF198A68),
                        width: 2)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        if (quantidade > 0) {
                          quantidade--;
                          widget.less();
                        }
                      }),
                      child: Container(
                        color: const Color(0xFF198A68),
                        height: 30,
                        width: 30,
                        child: const Icon(
                            FontAwesomeIcons.minus,
                            size: 18,
                            color: Colors.white),
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
                              style: TextStyleService.ticketInputWhite
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () => setState(() {
                        if (quantidade < widget.quantidadeDisponivel!) {
                          quantidade++;
                          widget.add();
                        }
                      }),
                      child: Container(
                        height: 30,
                        width: 30,
                        color: const Color(0xFF198A68),
                        child: const Icon(
                            FontAwesomeIcons.plus,
                            size: 18,
                            color: Colors.white),
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
