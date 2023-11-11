import 'dart:ffi';

import 'package:dibs/models/batchInput.dart';
import 'package:dibs/models/batchManage.dart';
import 'package:dibs/repositories/ticket-repository.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/expandableTextField.dart';
import 'package:dibs/widget/shadowedDropdown.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../models/idName.dart';
import '../repositories/batch-repository.dart';
import '../shared/routes/routes.dart';
import '../shared/service/textStyle.dart';
import '../widget/buttonPadrao.dart';
import '../widget/componenteGerenciadoDeLotes.dart';
import '../widget/textfieldpadrao.dart';

class ModalNovoLote extends StatefulWidget {
  String idDoEvento;
  List<IdName> listIdName;
  ModalNovoLote({required this.idDoEvento, required this.listIdName});

  @override
  State<ModalNovoLote> createState() => _ModalNovoLoteState();
}

class _ModalNovoLoteState extends State<ModalNovoLote> {
  TextEditingController titulo = TextEditingController();
  TextEditingController qntIngressos = TextEditingController();
  TextEditingController preco = TextEditingController();
  BatchStatus selectedStatus = BatchStatus.PUBLISHED;
  IdName? selectedIdName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: (MediaQuery.of(context).viewInsets.bottom)),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Novo Lote',
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
                              items: widget.listIdName.map((idName) {
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
                    enable: true,
                    delete: false,
                    width: 0.45,
                    text: "Salvar",
                    click: () async {
                      await BatchRepository(dio).criarLote(BatchInput(
                          name: titulo.text,
                          eventId: widget.idDoEvento,
                          event: null,
                          announcedPrice: double.parse(preco.text),
                          nextBatch: selectedIdName,
                          numberOfTickets: int.parse(qntIngressos.text),
                          status: selectedStatus));
                      ToastService.showToastInfo('Lote criado com sucesso!');
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
