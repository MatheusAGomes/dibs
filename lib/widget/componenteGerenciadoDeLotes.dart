import 'package:dibs/main.dart';
import 'package:dibs/models/batchInput.dart';
import 'package:dibs/models/batchOutput.dart';
import 'package:dibs/models/gambEditar.dart';
import 'package:dibs/repositories/batch-repository.dart';
import 'package:dibs/widget/modalEditarLote.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';

import '../models/batchManage.dart';
import '../models/idName.dart';

class ComponenteGerenciadoDeLotes extends StatelessWidget {
  String id;
  BatchManage lote;
  ComponenteGerenciadoDeLotes({required this.lote, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(7)),
      height: 60,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lote.name),
                Text(
                  'R\$ ${lote.announcedPrice}',
                  style: TextStyle(color: Colors.grey),
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

                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      builder: (BuildContext context) {
                        return ModalEditarLote(
                          loteId: lote.id,
                          idDoEvento: id,
                          listaIdName: lista,
                          lote: a,
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5)),
                    height: 35,
                    width: 35,
                    child: const Icon(
                      Icons.edit,
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
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
