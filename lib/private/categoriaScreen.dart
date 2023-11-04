import 'package:dibs/private/infoIngresso.dart';
import 'package:dibs/repositories/events-repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../main.dart';
import '../models/events.dart';
import '../models/eventsClient.dart';
import '../models/lote.dart';
import '../repositories/eventsClient-repository.dart';
import '../repositories/loteEvent-repository.dart';
import '../shared/enum/EvetnCategory.dart';
import '../shared/functions/utils.dart';
import '../shared/service/textStyle.dart';
import '../widget/bannerCategoriaEvento.dart';
import '../widget/meuPerfil.dart';
import '../widget/modalMeusCartoes.dart';

class CategoriaScreen extends StatefulWidget {
  Color cor;
  EventCategory category;

  Color cordois;
  String titulo;
  CategoriaScreen(this.cor, this.titulo, this.cordois, this.category,
      {super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: adjustShade(widget.cordois, 120),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Categorias',
            style: TextStyleService.appBar,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.angleLeft,
                color: Colors.black,
              )),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                child: FutureBuilder(
              future: EventsRepository(dio).getListEvents(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Events> listaFiltrada = snapshot.data!
                      .where((element) => element.category == widget.category)
                      .toList();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.titulo,
                          style: TextStyleService(categoryShadow: <Shadow>[
                            Shadow(
                                offset: Offset(1.5, 1.5),
                                color: Color.fromRGBO(126, 244, 209, 0.72))
                          ], fontSize: 22)
                              .corSublinhada),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      Column(
                        children: List.generate(
                            listaFiltrada.length,
                            (index) => Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        EventsClient a =
                                            await EventsClientRepository(dio)
                                                .getListEvents(
                                                    listaFiltrada[index].id!);
                                        List<Lote> b = await LoteRepository(dio)
                                            .getLotes(listaFiltrada[index].id!);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InfoIngressoScreen(
                                                      id: a.id,
                                                      nomeDoEvento: a.name,
                                                      data: a.startDate,
                                                      descricao: a.description,
                                                      fotoDoEvento:
                                                          NetworkImage(
                                                              a.picture),
                                                      hora: a.time,
                                                      local: a.address,
                                                      lotes: b,
                                                    )));
                                      },
                                      child: BannerCategoriaEvento(
                                        id: listaFiltrada[index].id!,
                                        titulo: listaFiltrada[index].name!,
                                        corUm: widget.cor,
                                        corDois: widget.cordois,
                                        data: listaFiltrada[index].startDate!,
                                        hora: listaFiltrada[index].time!,
                                        local: listaFiltrada[index].address!,
                                        image: const AssetImage(
                                            'assets/images/PericlesEx.png'),
                                      ),
                                    )
                                  ],
                                )),
                      )
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            )),
          ),
        ));
  }
}
