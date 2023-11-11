import 'package:dibs/models/batchOutput.dart';
import 'package:dibs/models/modeloRespostaEditTicket.dart';
import 'package:dibs/private/modalNovoCartao.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/shadowedDropdown.dart';
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

class EditarLoteScreen extends StatefulWidget {
  String loteId;
  String idDoEvento;
  List<IdName> listaIdName;
  BatchOutput lote;
  EditarLoteScreen(
      {required this.lote,
      required this.loteId,
      required this.listaIdName,
      required this.idDoEvento});

  @override
  State<EditarLoteScreen> createState() => _EditarLoteScreenState();
}

class _EditarLoteScreenState extends State<EditarLoteScreen> {
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Editar lote',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Titulo',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            controller: titulo,
                            height: 0.06,
                            hintText: "Pista - 1° Lote",
                            prefixIcon: Icon(
                              FontAwesomeIcons.masksTheater,
                              size: 16,
                            ))
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Qntd. de ingressos',
                                textAlign: TextAlign.left,
                                style: TextStyleService.defaultFieldLabel),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            ExpandableTextField(
                                controller: qntIngressos,
                                width: 0.42,
                                height: 0.06,
                                hintText: "100",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.ticketSimple,
                                  size: 16,
                                ))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Preço',
                                textAlign: TextAlign.left,
                                style: TextStyleService.defaultFieldLabel),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            ExpandableTextField(
                                controller: preco,
                                width: 0.42,
                                height: 0.06,
                                hintText: "R\$ 50,00",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.dollarSign,
                                  size: 16,
                                ))
                          ]),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Lote Programado',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ShadowedDropDown(
                          child: DropdownButton<IdName>(
                            value: selectedIdName,
                            isExpanded: true,
                            isDense: true,
                            underline: SizedBox(height: 0),
                            icon: Icon(FontAwesomeIcons.angleDown,
                                size: 18, color: Colors.grey),
                            style: TextStyleService(color: Color(0xFF909090))
                                .defaultTextField,
                            onChanged: (IdName? newValue) {
                              setState(() {
                                selectedIdName = newValue;
                              });
                            },
                            items: listaMostrada.map((idName) {
                              return DropdownMenuItem<IdName>(
                                value: idName,
                                child: Text(idName.name),
                                key: Key(idName
                                    .id), // Use o campo "id" como chave única
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Status',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ShadowedDropDown(
                          child: DropdownButton<BatchStatus>(
                            value: selectedStatus,
                            isExpanded: true,
                            isDense: true,
                            underline: SizedBox(height: 0),
                            icon: Icon(FontAwesomeIcons.angleDown,
                                size: 18, color: Colors.grey),
                            style: TextStyleService(color: Color(0xFF909090))
                                .defaultTextField,
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
                        )
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                ],
              ),
              ButtonPadrao(
                  text: 'Salvar',
                  click: () async {
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
                    Navigator.pop(context);
                    ToastService.showToastInfo('Lote editado com sucesso');
                  },
                  width: 0.45,
                  enable: true,
                  delete: false),
            ],
          ),
        ),
      ),
    );
  }
}
