import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../shared/service/textStyle.dart';

class modalConfigAnuncio extends StatefulWidget {
  String idDoEvento;
  modalConfigAnuncio({required this.idDoEvento});

  @override
  State<modalConfigAnuncio> createState() => _modalConfigAnuncioState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();

String? formadePagamento;
TextEditingController valor = TextEditingController(text: '');

class _modalConfigAnuncioState extends State<modalConfigAnuncio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Anunciar ingresso',
                    style: TextStyleService.modalTitle,
                  ),
                  InkWell(
                    child: Icon(
                        FontAwesomeIcons.xmark,
                        size: 18),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(
                color: Color(0x66000000),
                thickness: 1,
              ),

              const Row(
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
              const Divider(),
              const Row(
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
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Valor a receber',
                    style:
                    TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                  ),
                  Row(
                    children: [
                      Text("R\$ "),
                      Container(
                        width: 50,
                        child: ExpandableTextField(
                          click: () {},
                          height: 0.05,
                          controller: nomeController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Checkbox(
                    fillColor:
                    MaterialStateProperty.all((const Color(0xff2CAA84))),
                    value: checkboxValue,
                    onChanged: (value) => setState(() {
                      checkboxValue = value!;
                    }),
                  ),
                  const Text('Concordo com os termos')
                ],
              ),
              const Row(
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
                  child: const Padding(
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
                            checkboxValue
                                ? const Color(0xff198A68)
                                : Colors.grey)),
                    onPressed: () async {
                      if (checkboxValue != true) {
                        return;
                      }
                      await TicketRepository(dio)
                          .announceTicket(widget.idDoEvento,
                          double.parse(nomeController.text))
                          .then((value) => ToastService.showToastInfo(
                        'Ingresso anunciado',
                      ));
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Anunciar',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
