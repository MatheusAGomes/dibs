import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:dibs/widget/modalSecuresale.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/auth.dart';
import '../models/ticketOutput.dart';
import '../shared/service/textStyle.dart';

class modalConfigAnuncio extends StatefulWidget {
  TicketOutput evento;
  modalConfigAnuncio({required this.evento});

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
    Auth auth = Provider.of<Auth>(context, listen: false);

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
                    child: Icon(FontAwesomeIcons.xmark, size: 18),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Valor pago',
                    style: TextStyleService.appBar,
                  ),
                  widget.evento.halfPrice
                      ? Text("R\$ ${widget.evento.purchasePrice / 2}")
                      : Text("R\$ ${widget.evento.purchasePrice}"),
                ],
              ),
              // const Divider(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Valor de venda',
                    style: TextStyleService.appBar,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("R\$ "),
                      Container(
                        width: 50,
                        child: ExpandableTextField(
                          click: () {},
                          onchange: (a) {
                            setState(() {});
                          },
                          height: 0.04,
                          controller: nomeController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Valor a receber',
                    style: TextStyleService.appBar,
                  ),
                  Row(
                    children: [
                      Text(
                          "R\$ ${nomeController.text.isEmpty ? 0.00 : int.parse(nomeController.text) - (int.parse(nomeController.text) * 0.3)}"),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsetsDirectional.only(end: 5),
                      // padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: SizedBox(
                          width: 30,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.all(
                                (const Color(0xff2CAA84))),
                            value: checkboxValue,
                            onChanged: (value) => setState(() {
                              checkboxValue = value!;
                            }),
                          ))),
                  const Text('Concordo com os termos',
                      style: TextStyle(fontSize: 16, letterSpacing: -0.41)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Revenda protegida por',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: -0.41))),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  SvgPicture.asset("assets/icons/SecureResale.svg", width: 85),
                ],
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    builder: (BuildContext context) {
                      return ModalSecuresale();
                    },
                  );
                },
                child: Row(
                  children: [
                    Text('Saiba mais...',
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                letterSpacing: -0.41,
                                color: Color(0xFF198A68)))),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                    Icon(FontAwesomeIcons.circleInfo,
                        size: 16, color: Color(0xFF198A68))
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                children: [
                  Text(
                    'Forma de recebimento',
                    style: TextStyleService.companyBatchStatus,
                  ),
                ],
              ),
              ShadowedCard(
                  child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.pix),
                          SizedBox(
                            width: 10,
                          ),
                          Text('PIX',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.41))),
                        ],
                      ),
                      Icon(FontAwesomeIcons.solidPenToSquare, size: 18),
                    ],
                  ),
                ),
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ButtonPadrao(
                  text: 'Anunciar',
                  click: () async {
                    if (checkboxValue != true) {
                      return;
                    }
                    await TicketRepository(dio)
                        .announceTicket(
                            widget.evento.id, double.parse(nomeController.text))
                        .then((value) => ToastService.showToastInfo(
                              'Ingresso anunciado',
                            ));
                    nomeController.text = "";
                    Navigator.pop(context);
                    Navigator.pop(context);
                    auth.gambiarraMonstra();
                  },
                  width: 0.45,
                  enable: true,
                  delete: false),
            ],
          ),
        ),
      ),
    );
  }
}
