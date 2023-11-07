import 'package:dibs/models/batchManage.dart';
import 'package:dibs/models/gambEditar.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/private/modalNovoLote.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/buttonNewAction.dart';
import 'package:dibs/widget/buttonPadrao.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../repositories/batch-repository.dart';
import '../shared/service/textStyle.dart';
import '../widget/componenteGerenciadoDeLotes.dart';
import '../widget/textfieldpadrao.dart';

class GerenciarLoteScreen extends StatefulWidget {
  String idDoEvento;
  GerenciarLoteScreen({required this.idDoEvento});

  @override
  State<GerenciarLoteScreen> createState() => _GerenciarLoteScreenState();
}

bool checkboxValue = false;
TextEditingController nomeController = TextEditingController();

String? formadePagamento;
TextEditingController valor = TextEditingController(text: '');

class _GerenciarLoteScreenState extends State<GerenciarLoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Gerenciar lotes',
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
                      ButtonNewAction(
                          text: "Novo lote",
                          click: () async {
                            List<IdName> lista = await BatchRepository(dio)
                                .getLotesPossiveis(widget.idDoEvento);
                            showModalBottomSheet<void>(
                              useSafeArea: true,
                              isScrollControlled: true,
                              context: context,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                              ),
                              builder: (BuildContext context) {
                                return ModalNovoLote(
                                  idDoEvento: widget.idDoEvento,
                                  listIdName: lista,
                                );
                              },
                            );
                          }
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Color(0xFFD9D9D9),
                        thickness: 1,
                      ),
                      if (ativos.isNotEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Lotes Ativos',
                                style: TextStyleService.companyBatchStatus),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                            Column(
                              children: List.generate(ativos.length, (index) {
                                return ComponenteGerenciadoDeLotes(
                                  id: widget.idDoEvento,
                                  lote: ativos[index],
                                );
                              }),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                          ],
                        ),
                      if (criados.isNotEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Lotes Criados',
                                style: TextStyleService.companyBatchStatus),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
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
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          ],
                        ),
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
