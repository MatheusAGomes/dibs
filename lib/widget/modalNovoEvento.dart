import 'dart:io';

import 'package:dibs/models/cards.dart';
import 'package:dibs/private/modalNovoCartao.dart';
import 'package:dibs/repositories/card-repository.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../models/endereco.dart';
import '../models/eventInput.dart';
import '../repositories/events-repository.dart';
import '../shared/enum/EvetnCategory.dart';
import '../shared/functions/utils.dart';
import '../shared/service/toastService.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Novo evento',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Foto de capa'),
              InkWell(
                onTap: () {
                  _getImage();
                },
                child: Container(
                  height: 105,
                  width: 300,
                  child: fotoDeCapa != null
                      ? Image.network(fotoDeCapa!)
                      : SizedBox(),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.grey, width: 1)),
                ),
              ),
              Text('Titulo'),
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
                      Text('Data'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFieldPadrao(
                          controller: data,
                          click: () async {
                            dataTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)));
                            if (dataTime != null)
                              data.text = formatDateTime(dataTime!);
                          },
                          enable: true,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Horário'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFieldPadrao(
                          controller: hora,
                          click: () async {
                            timeOfday = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());
                            if (timeOfday != null) {
                              hora.text = formatTimeOfDay(timeOfday!);
                            }
                          },
                          enable: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Cidade'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFieldPadrao(
                          click: () {},
                          controller: cidade,
                          enable: true,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UF'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFieldPadrao(
                          controller: uf,
                          click: () {},
                          enable: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text('Categoria'),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: DropdownButton<EventCategory>(
                    value: selectedCategory,
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
                        child: Text(category.toEnumString()),
                      );
                    }).toList(),
                  )),
              Text('Descrição'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextFieldPadrao(
                  maxLines: 3,
                  controller: descricao,
                  click: () {},
                  enable: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    DateTime dateTimeResultante =
                        sumDateTimeAndTimeOfDay(dataTime!, timeOfday!);
                    print(dateTimeResultante);
                    await EventsRepository(dio).criarEvento(EventInput(
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
                    ToastService.showToastInfo('EVENTO CRIADO COM SUCESSO');
                    Navigator.pop(context);
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
                        'Criar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
