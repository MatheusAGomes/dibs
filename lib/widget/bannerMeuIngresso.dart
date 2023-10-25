import 'package:dibs/private/infoMeuIngresso.dart';
import 'package:dibs/private/meuEventoScreen.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerNewMeuIngresso.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../shared/service/colorService.dart';

class BannerMeuIngresso extends StatelessWidget {
  ImageProvider image;
  String titulo;
  String data;
  String hora;
  String lote;
  String tipo;
  Color corBanner;
  Color corDoLote;
  bool anuncio;
  bool empresa;

  BannerMeuIngresso(
      {super.key, required this.image,
      required this.titulo,
      required this.data,
      required this.hora,
      required this.lote,
      required this.tipo,
      required this.corBanner,
      required this.corDoLote,
      required this.anuncio,
      required this.empresa});

  @override
  Widget build(BuildContext context) {
    return anuncio
        ? BannerNewMeuIngresso(
            image: image,
            titulo: titulo,
            data: data,
            hora: hora,
            lote: lote,
            tipo: tipo,
            corBanner: corBanner,
            corDoLote: corDoLote,
            ticket: true,
    )
        : InkWell(
            onTap: () {
              if (empresa == false) {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  clipBehavior: Clip.antiAlias,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10)),
                  ),
                  builder: (BuildContext context) {
                    return InfoMeuIngressoScreen(
                      codigoDoIngresso: 'de7a89f51g477c82e23f68g',
                      cpf: '222.222.222-22',
                      fotoDoEvento: image,
                      nomeDoTitular: 'Matheus Assunção Gomes',
                      status: true,
                    );
                  },
                );
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MeuEventoScreen()));
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
                ticket: false
            ));
  }
}
