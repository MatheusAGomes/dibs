import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:flutter/material.dart';

import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';

class modalConfigAnuncio extends StatefulWidget {
  modalConfigAnuncio();

  @override
  State<modalConfigAnuncio> createState() => _modalConfigAnuncioState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();

String? formadePagamento;

class _modalConfigAnuncioState extends State<modalConfigAnuncio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anúncios Ativos',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    InkWell(
                      child: Icon(Icons.close),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: Color(0xff2CAA84)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Tipo do ingresso',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Nome do vendedor',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'R\$ 123.00',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valor pago',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                    Text("R\$ 123.00"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valor de venda',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                    Text("R\$ 123.00"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Valor a receber',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                    Text("R\$ 123.00"),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all((Color(0xff2CAA84))),
                      value: checkboxValue,
                      onChanged: (value) => setState(() {
                        checkboxValue = value!;
                      }),
                    ),
                    Text('Concordo com o termos')
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Forma de recebimento',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.pix),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Pix'),
                            ],
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              checkboxValue ? Color(0xff198A68) : Colors.grey)),
                      onPressed: () {
                        if (checkboxValue != true) {
                          return;
                        }
                      },
                      child: Text(
                        'Anunciar',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
