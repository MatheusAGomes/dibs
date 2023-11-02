import 'dart:io';

import 'package:dibs/models/endereco.dart';
import 'package:dibs/models/eventInput.dart';
import 'package:dibs/repositories/batch-repository.dart';
import 'package:dibs/repositories/events-repository.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/shared/service/toastService.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/modalAjuda.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/auth.dart';
import '../models/batchReportIndex.dart';
import '../models/events.dart';
import '../models/soldTickets.dart';
import '../shared/enum/EvetnCategory.dart';
import '../shared/functions/utils.dart';
import '../widget/meuPerfil.dart';
import '../widget/modalMeusCartoes.dart';
import '../widget/textfieldpadrao.dart';

class MainEmpresaScreen extends StatefulWidget {
  const MainEmpresaScreen({Key? key}) : super(key: key);

  @override
  State<MainEmpresaScreen> createState() => _MainEmpresaScreenState();
}

class _MainEmpresaScreenState extends State<MainEmpresaScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController buscaController = TextEditingController();
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
    Auth auth = Provider.of<Auth>(context, listen: false);

    buscaController.text;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset('assets/images/logoDibs.png'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: PopupMenuButton(
                  constraints: BoxConstraints.expand(width: 150, height: 170),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  icon: Icon(
                    Icons.menu_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'MeuPerfil':
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return MeuPerfil();
                          },
                        );
                        break;

                      case 'MeusCartões':
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          enableDrag: true,
                          isDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalMeusCartoes();
                          },
                        );
                        break;

                      case 'Ajuda':
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return ModalAjuda();
                          },
                        );
                        break;
                      default:
                    }
                  },
                  itemBuilder: (BuildContext bc) {
                    return [
                      PopupMenuItem(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Olá,${addEllipsis(auth.authDecoded!['login'].toString(), 4)}',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Icon(
                              Icons.person,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 30,
                        value: 'MeuPerfil',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Meu perfil",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 30,
                        value: 'MeusCartões',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Meus cartões",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        height: 30,
                        value: 'Ajuda',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Ajuda",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () async {
                          auth.deslogar();
                        },
                        height: 30,
                        value: 'Sair',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Sair",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ];
                  }),
            )
          ],
          actionsIconTheme: const IconThemeData(),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Olá, ${addEllipsis(auth.authDecoded!['login'].toString(), 15)}',
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ], fontSize: 22)
                        .corSublinhada),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        _getImage() async {
                          final ImagePicker _picker = ImagePicker();
                          XFile? imageFile = await _picker.pickImage(
                            source: ImageSource.gallery,
                            maxWidth: MediaQuery.of(context).size.width,
                            maxHeight: MediaQuery.of(context).size.height,
                          );
                          if (imageFile != null) {
                            String? fotoDeCapaa =
                                await uploadFile(File(imageFile.path));
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              color: Colors.grey, width: 1)),
                                    ),
                                  ),
                                  Text('Titulo'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      controller: titulo,
                                      click: () {},
                                      enable: true,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Data'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: TextFieldPadrao(
                                              controller: data,
                                              click: () async {
                                                dataTime = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.now()
                                                        .add(Duration(
                                                            days: 365)));
                                                if (dataTime != null)
                                                  data.text =
                                                      formatDateTime(dataTime!);
                                              },
                                              enable: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Horário'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: TextFieldPadrao(
                                              controller: hora,
                                              click: () async {
                                                timeOfday =
                                                    await showTimePicker(
                                                        context: context,
                                                        initialTime:
                                                            TimeOfDay.now());
                                                if (timeOfday != null) {
                                                  hora.text = formatTimeOfDay(
                                                      timeOfday!);
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Cidade'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: TextFieldPadrao(
                                              click: () {},
                                              controller: cidade,
                                              enable: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('UF'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      child: DropdownButton<EventCategory>(
                                        value: selectedCategory,
                                        onChanged: (EventCategory? newValue) {
                                          if (newValue != null) {
                                            setState(() {
                                              selectedCategory = newValue;
                                            });
                                          }
                                        },
                                        items: EventCategory.values
                                            .map((category) {
                                          return DropdownMenuItem<
                                              EventCategory>(
                                            value: category,
                                            child:
                                                Text(category.toEnumString()),
                                          );
                                        }).toList(),
                                      )),
                                  Text('Descrição'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: TextFieldPadrao(
                                      controller: descricao,
                                      maxlength: 5,
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
                                            sumDateTimeAndTimeOfDay(
                                                dataTime!, timeOfday!);
                                        print(dateTimeResultante);
                                        await EventsRepository(dio).criarEvento(
                                            EventInput(
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
                                        ToastService.showToastInfo(
                                            'EVENTO CRIADO COM SUCESSO');
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: const Color(0xFF198A68),
                                        ),
                                        width: 140,
                                        height: 40,
                                        child: const Center(
                                          child: Text(
                                            'Criar',
                                            style:
                                                TextStyle(color: Colors.white),
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
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5)),
                        height: 35,
                        width: 35,
                        child: const Icon(Icons.add),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Novo evento',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                FutureBuilder(
                  future: EventsRepository(dio).getNextEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Events evento = snapshot.data!;

                      return FutureBuilder(
                          future: Future.wait([
                            BatchRepository(dio)
                                .getLoteAtivo(snapshot.data!.id),
                            BatchRepository(dio)
                                .getIngressosTotais(snapshot.data!.id)
                          ]),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<BatchReportIndex> lotes =
                                  snapshot.data![0] as List<BatchReportIndex>;
                              SoldTickets ingressosVendidos =
                                  snapshot.data![1] as SoldTickets;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Proximo Evento',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                  Container(
                                    child: BannerPrincipal(
                                      empresa: true,
                                      id: evento.id!,
                                      height: 200,
                                      width: 400,
                                      image: NetworkImage(evento.picture!),
                                      titulo: evento.name!,
                                      data: evento.startDate!,
                                      hora: evento.time!,
                                      descricao: evento.description!,
                                      endereco: evento.address!,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    'Lotes ativos',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Column(
                                    children: List.generate(
                                        lotes.length,
                                        (index) => Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  lotes[index].name,
                                                  style: TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 13),
                                                ),
                                                Stack(
                                                  children: [
                                                    LinearPercentIndicator(
                                                      padding: EdgeInsets.zero,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.875,
                                                      animation: true,
                                                      lineHeight: 20.0,
                                                      animationDuration: 2500,
                                                      barRadius:
                                                          const Radius.circular(
                                                              5),
                                                      percent: 0.8,
                                                      linearStrokeCap:
                                                          LinearStrokeCap
                                                              .roundAll,
                                                      progressColor:
                                                          const Color(
                                                              0xFF198A68),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFDADADA),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 40),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Inteira',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                              '${lotes[index].numberOfFullPriceTickets}/${lotes[index].numberOfFullPriceTicketsTotal}',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF8D8D8D))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.005,
                                                ),
                                                Stack(
                                                  children: [
                                                    LinearPercentIndicator(
                                                      padding: EdgeInsets.zero,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.875,
                                                      animation: true,
                                                      lineHeight: 20.0,
                                                      animationDuration: 2500,
                                                      barRadius:
                                                          const Radius.circular(
                                                              5),
                                                      percent: lotes[index]
                                                              .numberOfHalfPriceTickets /
                                                          lotes[index]
                                                              .numberOfHalfPriceTicketsTotal,
                                                      linearStrokeCap:
                                                          LinearStrokeCap
                                                              .roundAll,
                                                      progressColor:
                                                          const Color(
                                                              0xFF10B981),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFDADADA),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 40),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text('Meia',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                          Text(
                                                              '${lotes[index].numberOfHalfPriceTickets}/${lotes[index].numberOfHalfPriceTicketsTotal}',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF8D8D8D))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                              ],
                                            )),
                                  ),
                                  Text(
                                    'Ingressos totais vendidos',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  LinearPercentIndicator(
                                    padding: EdgeInsets.zero,
                                    width: MediaQuery.of(context).size.width *
                                        0.875,
                                    animation: true,
                                    lineHeight: 20.0,
                                    animationDuration: 2500,
                                    barRadius: const Radius.circular(5),
                                    percent: ingressosVendidos.soldTickets /
                                        ingressosVendidos.totalTickets,
                                    center: Text(
                                      '${ingressosVendidos.soldTickets}/${ingressosVendidos.totalTickets}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor: const Color(0xFF198A68),
                                    backgroundColor: const Color(0xFFDADADA),
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          });
                    } else {
                      return SizedBox();
                    }
                  },
                )
              ],
            )),
          ),
        ));
  }
}
