import 'package:brasil_fields/brasil_fields.dart';
import 'package:dibs/main.dart';
import 'package:dibs/private/infoMeuIngresso.dart';
import 'package:dibs/private/meuEventoScreen.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerNewMeuIngresso.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/colorService.dart';

class BannerMeuIngresso extends StatelessWidget {
  ImageProvider image;
  String id;
  String titulo;
  String data;
  String hora;
  String lote;
  String tipo;
  Color corBanner;
  Color corDoLote;
  bool anuncio;
  bool empresa;
  bool ativo;
  String local;
  BannerMeuIngresso(
      {super.key,
      required this.id,
      required this.local,
      required this.image,
      required this.titulo,
      required this.data,
      required this.hora,
      required this.lote,
      required this.tipo,
      required this.corBanner,
      required this.corDoLote,
      required this.anuncio,
      required this.empresa,
      required this.ativo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          if (empresa == false) {
            final a = await TicketRepository(dio).getTicket(id);
            print(a);
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              builder: (BuildContext context) {
                return InfoMeuIngressoScreen(
                    id: a.id,
                    anuncio: anuncio,
                    codigoDoIngresso: a.qrCode,
                    cpf: UtilBrasilFields.obterCpf(a.cpf),
                    fotoDoEvento: image,
                    nomeDoTitular: a.name,
                    status: a.valid,
                    data: a.date,
                    hora: a.time,
                    local: a.address,
                    nomeEvento: a.eventName,
                    tipoIngresso: a.halfPrice ? 'Meia Entrada' : 'Inteira',
                    lote: a.batchName,
                    preco: a.halfPrice
                        ? ' ${UtilBrasilFields.obterReal(a.purchasePrice / 2)}'
                        : ' ${UtilBrasilFields.obterReal(a.purchasePrice)}');
              },
            );
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MeuEventoScreen()));
          }
        },
        child: BannerNewMeuIngresso(
            image: image,
            titulo: titulo,
            data: data,
            hora: hora,
            lote: lote,
            tipo: tipo,
            corBanner: corBanner,
            corDoLote: corDoLote,
            ticket: anuncio));
  }
}
