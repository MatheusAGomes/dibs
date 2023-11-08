import 'package:dibs/shared/routes/routes.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/modalTransferencia.dart';

class CompraFinalizada extends StatefulWidget {
  double total;

  CompraFinalizada({super.key, required this.total});

  @override
  State<CompraFinalizada> createState() => _CompraFinalizadaState();
}

class _CompraFinalizadaState extends State<CompraFinalizada> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                FontAwesomeIcons.xmark,
                color: Colors.grey,
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Center(
                child: Icon(
                  FontAwesomeIcons.circleCheck,
                  color: Color(0xFF1BBC0D),
                  size: 100,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text('Compra finalizada!',
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          letterSpacing: -1.41))),
              Text('Pagamento realizado com sucesso.',
                  style: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          letterSpacing: -0.41,
                          color: Colors.grey,
                          height: 1))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ShadowedCard(
                  child: Padding(
                padding: EdgeInsets.zero,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${auth.authDecoded!['login'].toString()}",
                          style: TextStyleService.labelSubtitle)
                    ],
                  ),
                ),
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ShadowedCard(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.solidCreditCard, size: 20),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Crédito', style: TextStyleService.ticketInput)
                        ],
                      ),
                      Divider(
                        color: Color(0xFFD9D9D9),
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal',
                              style: TextStyle(letterSpacing: -0.41)),
                          Text("R\$ ${widget.total}",
                              style: TextStyle(letterSpacing: -0.41))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Desconto',
                              style: TextStyle(letterSpacing: -0.41)),
                          Text("R\$ 0,00",
                              style: TextStyle(letterSpacing: -0.41))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                letterSpacing: -0.41,
                              ))),
                          Text(
                            "R\$ ${widget.total}",
                            style: GoogleFonts.jost(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              letterSpacing: -0.91,
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ShadowedCard(
                  child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  auth.gambiarraMonstra();
                },
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Voltar para tela inicial',
                            style: TextStyleService.labelSubtitle)
                      ],
                    ),
                  ),
                ),
              )),
            ]),
          )),
        ),
      ),
    );
  }
}
