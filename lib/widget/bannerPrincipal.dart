import 'package:dibs/models/eventsClient.dart';
import 'package:dibs/models/lote.dart';
import 'package:dibs/private/infoIngresso.dart';
import 'package:dibs/private/meuEventoScreen.dart';
import 'package:dibs/private/meusEventoEmpresaScreen.dart';
import 'package:dibs/repositories/eventsClient-repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../repositories/loteEvent-repository.dart';

class BannerPrincipal extends StatelessWidget {
  NetworkImage image;
  String titulo;
  double height;
  double width;
  String id;
  bool empresa;
  String data;
  String endereco;
  String descricao;
  String hora;
  BannerPrincipal(
      {super.key,
      this.endereco = '',
      this.data = '',
      this.descricao = '',
      this.hora = '',
      required this.empresa,
      required this.id,
      required this.image,
      required this.titulo,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //
        if (!empresa) {
          EventsClient a = await EventsClientRepository(dio).getListEvents(id);
          List<Lote> b = await LoteRepository(dio).getLotes(id);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InfoIngressoScreen(
                        id: a.id,
                        nomeDoEvento: a.name,
                        data: a.startDate,
                        descricao: a.description,
                        fotoDoEvento: image,
                        hora: a.time,
                        local: a.address,
                        lotes: b,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MeuEventoScreen(
                        image: image,
                        id: id,
                        data: data,
                        nome: titulo,
                        endereco: endereco,
                        descricao: descricao,
                        hora: hora,
                      )));
        }

        // showModalBottomSheet<void>(
        //   isScrollControlled: true,
        //   context: context,
        //   builder: (BuildContext context) {
        //     return InfoIngressoScreen(
        //       id: a.id,
        //       nomeDoEvento: a.name,
        //       data: a.startDate,
        //       descricao: a.description,
        //       fotoDoEvento: image,
        //       hora: a.time,
        //       local: a.address,
        //       lotes: b,
        //     );
        //   },
        // );
      },
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(fit: BoxFit.cover, image: image),
              borderRadius: BorderRadiusDirectional.circular(10)),
          width: width,
          height: height,
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 60,
            width: width,
            child: Text(
              titulo,
              style: GoogleFonts.jost(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.41,
                      height: 1.13)),
            ),
          ),
        ),
      ]),
    );
  }
}
