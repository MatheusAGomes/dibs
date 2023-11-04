import 'package:dibs/models/batchOutput.dart';
import 'package:dibs/models/modeloRespostaEditTicket.dart';
import 'package:dibs/private/modalNovoCartao.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../models/batchInput.dart';
import '../models/idName.dart';
import '../repositories/batch-repository.dart';
import '../shared/enum/BatchStatusEnum.dart';
import '../shared/service/colorService.dart';
import '../shared/service/textStyle.dart';
import 'buttonPadrao.dart';
import 'expandableTextField.dart';

class ModalEditarLote extends StatefulWidget {
  String loteId;
  String idDoEvento;
  List<IdName> listaIdName;
  BatchOutput lote;
  ModalEditarLote(
      {required this.lote,
      required this.loteId,
      required this.listaIdName,
      required this.idDoEvento});

  @override
  State<ModalEditarLote> createState() => _ModalEditarLoteState();
}

class _ModalEditarLoteState extends State<ModalEditarLote> {
  bool primeira = true;
  TextEditingController titulo = TextEditingController();
  TextEditingController qntIngressos = TextEditingController();
  TextEditingController preco = TextEditingController();
  BatchStatus selectedStatus = BatchStatus.PUBLISHED;
  IdName? selectedIdName;
  List<IdName> listaMostrada = [];
  populandoTela() {
    if (primeira) {
      titulo.text = widget.lote.name;
      qntIngressos.text = widget.lote.numberOfTickets.toString();
      preco.text = widget.lote.announcedPrice.toString();
      selectedStatus = widget.lote.status;
      selectedIdName = widget.lote.nextBatch;
      primeira = false;
      listaMostrada = widget.listaIdName.where(
        (element) {
          return element.id != widget.loteId;
        },
      ).toList();
      if (selectedIdName != null) listaMostrada.add(selectedIdName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    populandoTela();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Novo lote',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text('Titulo'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextFieldPadrao(
                controller: titulo,
                click: () {},
                enable: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Qntd. de ingressos'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFieldPadrao(
                        controller: qntIngressos,
                        click: () {},
                        enable: true,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Preço'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFieldPadrao(
                        controller: preco,
                        click: () {},
                        enable: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text('Lotes Programado'),
            DropdownButton<IdName>(
              value: selectedIdName,
              onChanged: (IdName? newValue) {
                setState(() {
                  selectedIdName = newValue;
                });
              },
              items: listaMostrada.map((idName) {
                return DropdownMenuItem<IdName>(
                  value: idName,
                  child: Text(idName.name),
                  key: Key(idName.id), // Use o campo "id" como chave única
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Status'),
            DropdownButton<BatchStatus>(
              value: selectedStatus,
              onChanged: (BatchStatus? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedStatus = newValue;
                  });
                }
              },
              items: BatchStatus.values.map((status) {
                return DropdownMenuItem<BatchStatus>(
                  value: status,
                  child: Text(
                    status.toEnumString(),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  await BatchRepository(dio).updateLote(
                      widget.loteId,
                      BatchInput(
                          id: widget.loteId,
                          name: titulo.text,
                          eventId: widget.idDoEvento,
                          event: null,
                          announcedPrice: double.parse(preco.text),
                          nextBatch: selectedIdName,
                          numberOfTickets: int.parse(qntIngressos.text),
                          status: selectedStatus));
                },
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
    );
  }
}
