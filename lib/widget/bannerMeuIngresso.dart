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
  bool ativo;

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
      required this.empresa,
      required this.ativo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
              if (empresa == false) {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10)),
                  ),
                  builder: (BuildContext context) {
                    return InfoMeuIngressoScreen(
                      anuncio: anuncio,
                      codigoDoIngresso: 'de7a89f51g477c82e23f68g',
                      cpf: '222.222.222-22',
                      fotoDoEvento: image,
                      nomeDoTitular: 'Matheus Assunção Gomes',
                      status: ativo,
                      data: '20/12/2020',
                      hora: '19:30',
                      local: 'Campinas - SP',
                      nomeEvento: 'Churrasquinho Menos é Mais',
                      tipoIngresso: 'Meia Entrada',
                      lote: 'Área Vip - 1° Lote',
                      preco: 'R\$ 40,00',
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
                ticket: anuncio
            ));
  }
}
