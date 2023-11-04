import 'dart:ffi';

import 'package:dibs/models/batchInput.dart';
import 'package:dibs/models/batchManage.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/idName.dart';
import '../repositories/batch-repository.dart';
import '../widget/componenteGerenciadoDeLotes.dart';
import '../widget/textfieldpadrao.dart';

class ModalFormularioNovoLote extends StatefulWidget {
  String idDoEvento;
  List<IdName> listIdName;
  ModalFormularioNovoLote({required this.idDoEvento, required this.listIdName});

  @override
  State<ModalFormularioNovoLote> createState() =>
      _ModalFormularioNovoLoteState();
}

class _ModalFormularioNovoLoteState extends State<ModalFormularioNovoLote> {
  TextEditingController titulo = TextEditingController();
  TextEditingController qntIngressos = TextEditingController();
  TextEditingController preco = TextEditingController();
  BatchStatus selectedStatus = BatchStatus.PUBLISHED;
  IdName? selectedIdName;
  @override
  Widget build(BuildContext context) {
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
              items: widget.listIdName.map((idName) {
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
                  await BatchRepository(dio).criarLote(BatchInput(
                      name: titulo.text,
                      eventId: widget.idDoEvento,
                      event: null,
                      announcedPrice: double.parse(preco.text),
                      nextBatch: selectedIdName,
                      numberOfTickets: int.parse(qntIngressos.text),
                      status: selectedStatus));
                  ToastService.showToastInfo('Lote criado com sucesso!');
                  Navigator.canPop(context);
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
