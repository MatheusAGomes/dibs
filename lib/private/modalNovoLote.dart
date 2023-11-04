import 'package:dibs/models/batchManage.dart';
import 'package:dibs/models/gambEditar.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/private/modalFormularioNovoLote.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../repositories/batch-repository.dart';
import '../widget/componenteGerenciadoDeLotes.dart';
import '../widget/textfieldpadrao.dart';

class ModalGerenciarLote extends StatefulWidget {
  String idDoEvento;
  ModalGerenciarLote({required this.idDoEvento});

  @override
  State<ModalGerenciarLote> createState() => _ModalGerenciarLoteState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();

String? formadePagamento;
TextEditingController valor = TextEditingController(text: '');

class _ModalGerenciarLoteState extends State<ModalGerenciarLote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Gerenciar lotes',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: FutureBuilder(
        future: BatchRepository(dio).getAllLotes(widget.idDoEvento),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BatchManage> ativos = snapshot.data!
                .where((element) => element.status == BatchStatus.PUBLISHED)
                .toList();
            List<BatchManage> criados = snapshot.data!
                .where((element) => element.status == BatchStatus.CREATED)
                .toList();
            List<BatchManage> finalizados = snapshot.data!
                .where((element) => element.status == BatchStatus.FINISHED)
                .toList();
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          List<IdName> lista = await BatchRepository(dio)
                              .getLotesPossiveis(widget.idDoEvento);
                          showModalBottomSheet<void>(
                            useSafeArea: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return ModalFormularioNovoLote(
                                idDoEvento: widget.idDoEvento,
                                listIdName: lista,
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Icon(Icons.add),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Novo Lote'),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      if (ativos.isNotEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lotes Ativos'),
                            Column(
                              children: List.generate(ativos.length, (index) {
                                return ComponenteGerenciadoDeLotes(
                                  id: widget.idDoEvento,
                                  lote: ativos[index],
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      if (criados.isNotEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lotes criados'),
                            Column(
                              children: List.generate(criados.length, (index) {
                                return ComponenteGerenciadoDeLotes(
                                  id: widget.idDoEvento,
                                  lote: criados[index],
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      if (finalizados.isNotEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lotes finalizados'),
                            Column(
                              children:
                                  List.generate(finalizados.length, (index) {
                                return ComponenteGerenciadoDeLotes(
                                  id: widget.idDoEvento,
                                  lote: finalizados[index],
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      Center(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color(0xFF198A68),
                            ),
                            width: 140,
                            height: 40,
                            child: const Center(
                              child: Text(
                                'Salvar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
