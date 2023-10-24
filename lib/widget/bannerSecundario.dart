import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../models/eventsClient.dart';
import '../models/lote.dart';
import '../private/infoIngresso.dart';
import '../repositories/eventsClient-repository.dart';
import '../repositories/loteEvent-repository.dart';

class BannerSecundario extends StatelessWidget {
  ImageProvider image;
  String id;
  String titulo;

  BannerSecundario(
      {super.key, required this.id, required this.image, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        EventsClient a = await EventsClientRepository(dio).getListEvents(id);
        List<Lote> b = await LoteRepository(dio).getLotes(id);
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return InfoIngressoScreen(
              lotes: b,
              nomeDoEvento: a.name,
              data: a.startDate,
              descricao: a.description,
              fotoDoEvento: image,
              hora: a.time,
            );
          },
        );
      },
      child: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              ),
              borderRadius: BorderRadiusDirectional.circular(10)),
          width: 120,
        ),
        Container(
          width: 120,
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
            height: 45,
            width: 120,
            child: Text(
              titulo,
              style: GoogleFonts.jost(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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
