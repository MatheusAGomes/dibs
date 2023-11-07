import 'package:dibs/main.dart';
import 'package:dibs/models/batchInput.dart';
import 'package:dibs/models/batchOutput.dart';
import 'package:dibs/models/gambEditar.dart';
import 'package:dibs/repositories/batch-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/editarLote.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/batchManage.dart';
import '../models/idName.dart';

class ComponenteGerenciadoDeLotes extends StatelessWidget {
  String id;
  BatchManage lote;
  ComponenteGerenciadoDeLotes({required this.lote, required this.id});

  @override
  Widget build(BuildContext context) {
    return ShadowedCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      lote.name,
                      style: TextStyleService.ticketInput),
                  Text(
                    'R\$ ${lote.announcedPrice}',
                    style: TextStyleService.ticketPrice,
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      List<IdName> lista =
                      await BatchRepository(dio).getLotesPossiveis(id);
                      BatchOutput a =
                      await BatchRepository(dio).getLoteId(lote.id);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditarLoteScreen(
                                    loteId: lote.id,
                                    idDoEvento: id,
                                    listaIdName: lista,
                                    lote: a,
                                  )
                          )
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      height: 35,
                      width: 35,
                      child: const Icon(
                        FontAwesomeIcons.solidPenToSquare,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      height: 35,
                      width: 35,
                      child: const Icon(
                        FontAwesomeIcons.solidTrashCan,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}
