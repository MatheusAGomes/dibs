import 'dart:io';

import 'package:dibs/models/cards.dart';
import 'package:dibs/private/modalNovoCartao.dart';
import 'package:dibs/repositories/card-repository.dart';
import 'package:dibs/shared/enum/EventStatus.dart';
import 'package:dibs/widget/shadowedDropdown.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../models/endereco.dart';
import '../models/eventInput.dart';
import '../repositories/events-repository.dart';
import '../shared/enum/EvetnCategory.dart';
import '../shared/functions/utils.dart';
import '../shared/routes/routes.dart';
import '../shared/service/textStyle.dart';
import '../shared/service/toastService.dart';
import 'buttonPadrao.dart';
import 'expandableTextField.dart';
import 'meuCartaoComponente.dart';

class ModalNovoEvento extends StatefulWidget {
  ModalNovoEvento({super.key});

  @override
  State<ModalNovoEvento> createState() => _ModalNovoEventoState();
}

class _ModalNovoEventoState extends State<ModalNovoEvento> {
  String? fotoDeCapa;

  TextEditingController titulo = TextEditingController();

  TextEditingController data = TextEditingController();

  TextEditingController hora = TextEditingController();

  TextEditingController cidade = TextEditingController();

  TextEditingController uf = TextEditingController();

  TextEditingController categoria = TextEditingController();

  TextEditingController descricao = TextEditingController();

  DateTime? dataTime;

  TimeOfDay? timeOfday;

  EventCategory selectedCategory = EventCategory.SHOW;
  EventStatusEnum status = EventStatusEnum.CREATED;

  @override
  Widget build(BuildContext context) {
    _getImage() async {
      final ImagePicker _picker = ImagePicker();
      XFile? imageFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      );
      if (imageFile != null) {
        String? fotoDeCapaa = await uploadFile(File(imageFile.path));
        if (fotoDeCapaa != null) {
          setState(() {
            fotoDeCapa = fotoDeCapaa;
          });
        }
        print(fotoDeCapa);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          padding: EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 35),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Novo Evento',
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
                        Text('Foto de capa',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        InkWell(
                          onTap: () {
                            _getImage();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 300,
                            child: fotoDeCapa != null
                                ? null
                                : Padding(
                                    padding: EdgeInsetsDirectional.only(top: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(FontAwesomeIcons.solidImages,
                                            color: Color(0XFF909090), size: 45),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Clique aqui para adicionar\n'
                                                'uma foto ao seu evento',
                                                style: TextStyleService(
                                                        color:
                                                            Color(0xFF909090))
                                                    .defaultTextField),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.005),
                                            Text(
                                                'Resolução adequada:\n'
                                                '1440x140',
                                                style: TextStyleService
                                                    .mediumSpacing041)
                                          ],
                                        )
                                      ],
                                    )),
                            decoration: BoxDecoration(
                                image: fotoDeCapa != null
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(fotoDeCapa!))
                                    : null,
                                borderRadius: BorderRadius.circular(7),
                                // border: Border.all(
                                //     color: Color(0x33000000)
                                // ),
                                color: Color(0xFFD9D9D9),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(2, 2),
                                      blurRadius: 0.3)
                                ]),
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
                        Text('Título',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            controller: titulo,
                            click: () {},
                            height: 0.06,
                            enable: true,
                            hintText: "Churrasquinho Menos é Mais",
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
                            Text('Data',
                                textAlign: TextAlign.left,
                                style: TextStyleService.defaultFieldLabel),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            ExpandableTextField(
                                controller: data,
                                click: () async {
                                  dataTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 365)));
                                  if (dataTime != null)
                                    data.text = formatDateTime(dataTime!);
                                },
                                width: 0.42,
                                height: 0.06,
                                enable: true,
                                hintText: "01/01/1970",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.solidCalendar,
                                  size: 16,
                                ))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Horário',
                                textAlign: TextAlign.left,
                                style: TextStyleService.defaultFieldLabel),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            ExpandableTextField(
                                controller: hora,
                                click: () async {
                                  timeOfday = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  if (timeOfday != null) {
                                    hora.text = formatTimeOfDay(timeOfday!);
                                  }
                                },
                                width: 0.42,
                                height: 0.06,
                                enable: true,
                                hintText: "13:00",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.solidClock,
                                  size: 16,
                                ))
                          ]),
                    ],
                  ),
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
                            Text('Cidade',
                                textAlign: TextAlign.left,
                                style: TextStyleService.defaultFieldLabel),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            ExpandableTextField(
                                controller: cidade,
                                click: () {},
                                width: 0.42,
                                height: 0.06,
                                enable: true,
                                hintText: "Campinas",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.locationDot,
                                  size: 16,
                                ))
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Estado (UF)',
                                textAlign: TextAlign.left,
                                style: TextStyleService.defaultFieldLabel),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            ExpandableTextField(
                                controller: uf,
                                click: () {},
                                width: 0.42,
                                height: 0.06,
                                enable: true,
                                hintText: "SP",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.locationDot,
                                  size: 16,
                                ))
                          ])
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Categoria',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ShadowedDropDown(
                          child: DropdownButton<EventCategory>(
                            value: selectedCategory,
                            isExpanded: true,
                            isDense: true,
                            underline: SizedBox(height: 0),
                            icon: Icon(FontAwesomeIcons.angleDown,
                                size: 18, color: Colors.grey),
                            style: TextStyleService(color: Color(0xFF909090))
                                .defaultTextField,
                            onChanged: (EventCategory? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  selectedCategory = newValue;
                                });
                              }
                            },
                            items: EventCategory.values.map((category) {
                              return DropdownMenuItem<EventCategory>(
                                  value: category,
                                  child: Text(category.toEnumString(),
                                      style: TextStyleService(
                                              color: Color(0xFF909090))
                                          .defaultTextField));
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
                          child: DropdownButton<EventStatusEnum>(
                            value: status,
                            isExpanded: true,
                            isDense: true,
                            underline: SizedBox(height: 0),
                            icon: Icon(FontAwesomeIcons.angleDown,
                                size: 18, color: Colors.grey),
                            style: TextStyleService(color: Color(0xFF909090))
                                .defaultTextField,
                            onChanged: (EventStatusEnum? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  status = newValue;
                                });
                              }
                            },
                            items: EventStatusEnum.values.map((status) {
                              return DropdownMenuItem<EventStatusEnum>(
                                  value: status,
                                  child: Text(status.toEnumString(),
                                      style: TextStyleService(
                                              color: Color(0xFF909090))
                                          .defaultTextField));
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
                        Text('Descrição',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                          controller: descricao,
                          click: () {},
                          height: 0.08,
                          maxLines: 3,
                          enable: true,
                          // hintText: "Churrasquinho Menos é Mais",
                        )
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                ]),
                ButtonPadrao(
                    enable: true,
                    delete: false,
                    width: 0.45,
                    text: "Criar",
                    click: () async {
                      DateTime dateTimeResultante =
                          sumDateTimeAndTimeOfDay(dataTime!, timeOfday!);
                      print(dateTimeResultante);
                      await EventsRepository(dio).criarEvento(EventInput(
                          status: status,
                          address: Endereco(
                              cep: 'cep',
                              logradouro: 'logradouro',
                              complemento: 'complemento',
                              numero: 'numero',
                              bairro: 'bairro',
                              cidade: cidade.text,
                              uf: uf.text,
                              ddd: 'ddd'),
                          description: descricao.text,
                          name: titulo.text,
                          picture: fotoDeCapa ?? '',
                          startDate: dateTimeResultante,
                          category: selectedCategory));
                      ToastService.showToastInfo('Evento criado com sucesso');
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
