import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/widget/modalEditar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main.dart';
import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/buttonPadrao.dart';
import '../widget/modalTransferencia.dart';

class InfoMeuIngressoScreen extends StatelessWidget {
  String? data;
  String? hora;
  String? local;
  String? nomeEvento;
  String? tipoIngresso;
  String? codigoDoIngresso;
  String? nomeDoTitular;
  String? cpf;
  String? lote;
  String? preco;
  ImageProvider? fotoDoEvento;
  bool status;
  bool anuncio;
  String id;

  InfoMeuIngressoScreen(
      {required this.data,
      required this.id,
      required this.hora,
      required this.local,
      required this.nomeEvento,
      required this.tipoIngresso,
      required this.codigoDoIngresso,
      required this.nomeDoTitular,
      required this.cpf,
      required this.lote,
      required this.preco,
      required this.fotoDoEvento,
      required this.status,
      required this.anuncio});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.22,
                    left: 25,
                    right: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(FontAwesomeIcons.solidCalendar, size: 16),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.005,
                                ),
                                Text(data!,
                                    style: TextStyleService(
                                            fontSize: 11, letterSpacing: -1.41)
                                        .medium)
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(FontAwesomeIcons.solidClock, size: 16),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.005,
                                ),
                                Text(hora!,
                                    style: TextStyleService(
                                            fontSize: 11, letterSpacing: -1.41)
                                        .medium)
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(FontAwesomeIcons.locationDot, size: 16),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.005,
                            ),
                            Text(local!,
                                style: TextStyleService(
                                        fontSize: 11, letterSpacing: -0.09)
                                    .medium)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Flexible(
                                    child: Text(nomeEvento!,
                                        textAlign: TextAlign.center,
                                        style: TextStyleService(fontSize: 16)
                                            .boldSpacing041)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(tipoIngresso!)],
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                      child: Column(
                        children: [
                          PrettyQrView.data(
                              data: codigoDoIngresso!,
                              decoration: const PrettyQrDecoration(
                                  image: PrettyQrDecorationImage(
                                      image: AssetImage(
                                          "assets/icons/dibsLogoQrCode.png"),
                                      scale: 0.2),
                                  shape: PrettyQrSmoothSymbol())),
                        ],
                      ),
                    ),
                    Center(
                        child: Text(codigoDoIngresso!,
                            style: TextStyle(fontSize: 12))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Titular',
                            style:
                                TextStyleService(fontSize: 14).boldSpacing041),
                        Text('Lote',
                            style:
                                TextStyleService(fontSize: 14).boldSpacing041),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 3,
                            child: Text(nomeDoTitular!,
                                style: TextStyle(fontSize: 12))),
                        Flexible(
                            flex: 2,
                            child: Text(lote!,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12))),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('CPF',
                            style:
                                TextStyleService(fontSize: 14).boldSpacing041),
                        Text('Preço',
                            style:
                                TextStyleService(fontSize: 14).boldSpacing041),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(cpf!, style: TextStyle(fontSize: 12))),
                        Flexible(
                            child: Text(preco!,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 12))),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    anuncio
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: ButtonPadrao(
                                      enable: status,
                                      delete: true,
                                      width: 0.5,
                                      text: 'Cancelar Anúncio',
                                      click: () async {
                                        if (status != true) {
                                          return;
                                        }
                                        await TicketRepository(dio)
                                            .removeAnnounceTicket(id);
                                      })),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  child: ButtonPadrao(
                                      enable: status,
                                      delete: false,
                                      width: 0.5,
                                      text: 'Transferir',
                                      click: () {
                                        if (status != true) {
                                          return;
                                        }
                                        showModalBottomSheet(
                                            context: context,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(10)),
                                            ),
                                            builder: ((context) =>
                                                ModalTransferencia()));
                                      })),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  child: ButtonPadrao(
                                      enable: status,
                                      delete: false,
                                      width: 0.5,
                                      text: 'Editar',
                                      click: () {
                                        if (status != true) {
                                          return;
                                        }
                                        showModalBottomSheet(
                                            context: context,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(10)),
                                            ),
                                            builder: ((context) => ModalEditar(
                                                  id: id,
                                                )));
                                      })),
                            ],
                          ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: fotoDoEvento!,
                    alignment: Alignment.topCenter),
              ),
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
