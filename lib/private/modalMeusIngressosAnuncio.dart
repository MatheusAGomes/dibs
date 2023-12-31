import 'package:dibs/private/modalConfigAnuncio.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../models/meuIngressoBanner.dart';
import '../shared/service/textStyle.dart';
import '../widget/bannerCategoriaEvento.dart';

class ModalMeusIngressosAnuncio extends StatefulWidget {
  List<MeuIngressoBanner> meuIngressos;
  ModalMeusIngressosAnuncio({super.key, required this.meuIngressos});

  @override
  State<ModalMeusIngressosAnuncio> createState() =>
      _ModalMeusIngressosAnuncioState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();

class _ModalMeusIngressosAnuncioState extends State<ModalMeusIngressosAnuncio> {
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
                    'Meus ingressos',
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.67,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.meuIngressos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                          onTap: () async {
                            final a = await TicketRepository(dio)
                                .getTicket(widget.meuIngressos[index].id);
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                              ),
                              builder: (BuildContext context) {
                                return modalConfigAnuncio(
                                  evento: a,
                                );
                              },
                            );
                          },
                          child: BannerCategoriaEvento(
                            id: widget.meuIngressos[index].id,
                            titulo: widget.meuIngressos[index].eventName,
                            corUm: Colors.green,
                            corDois: Colors.green,
                            data: widget.meuIngressos[index].startDate,
                            hora: widget.meuIngressos[index].time!,
                            local: widget.meuIngressos[index].address,
                            image: NetworkImage(
                                widget.meuIngressos[index].picture!),
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
