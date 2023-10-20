import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';

class BannerIngressoMarketPlace extends StatefulWidget {
  String? tipoDoIngresso;
  String? valor;
  BannerIngressoMarketPlace(
      {super.key, required this.tipoDoIngresso, required this.valor});

  @override
  State<BannerIngressoMarketPlace> createState() =>
      _BannerIngressoMarketPlaceState();
}

class _BannerIngressoMarketPlaceState extends State<BannerIngressoMarketPlace> {
  bool aberto = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          aberto = !aberto;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: aberto
            ? Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color(0xffFF8A65),
                ),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.confirmation_num,
                                  size: 30,
                                ),
                                Text(
                                  widget.tipoDoIngresso!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Text("R\$ ${widget.valor}")
                        ]),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.person,
                                  ),
                                  Text(hideLastName('Luis Ciarbello')),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('R\$ 120.00',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 12)),
                                  Text(
                                    'R\$ 200.00',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart_checkout))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color(0xffFF8A65),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.confirmation_num,
                              size: 30,
                            ),
                            Text(
                              widget.tipoDoIngresso!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Text("R\$ ${widget.valor}")
                    ]),
              ),
      ),
    );
  }
}
