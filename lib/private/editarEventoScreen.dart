import 'package:dibs/shared/routes/routes.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../shared/enum/EvetnCategory.dart';
import '../shared/functions/utils.dart';
import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/buttonPadrao.dart';
import '../widget/expandableTextField.dart';
import '../widget/modalTransferencia.dart';

class EditarEventoScreen extends StatefulWidget {

  EditarEventoScreen({super.key});

  @override
  State<EditarEventoScreen> createState() => _EditarEventoScreenState();
}

class _EditarEventoScreenState extends State<EditarEventoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Editar evento',
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Foto de capa',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    InkWell(
                      onTap: () {
                        // _getImage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 300,
                        child:
                        // fotoDeCapa != null
                        //     ? null
                        //     :
                          Padding(
                            padding: EdgeInsetsDirectional.only(top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(FontAwesomeIcons.solidImages,
                                    color: Color(0XFF909090),
                                    size: 45),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Clique aqui para adicionar\n'
                                        'uma foto ao seu evento',
                                        style: TextStyleService(
                                            color: Color(0xFF909090)
                                        ).defaultTextField),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                                    Text('Resolução adequada:\n'
                                        '1440x140',
                                        style: TextStyleService.mediumSpacing041)
                                  ],
                                )
                              ],
                            )
                        ),
                        decoration: BoxDecoration(
                            // image:
                            // fotoDeCapa != null
                            //     ? DecorationImage(
                            //     fit: BoxFit.cover,
                            //     image: NetworkImage(fotoDeCapa!))
                            //     : null,
                            borderRadius: BorderRadius.circular(7),
                            // border: Border.all(
                            //     color: Color(0x33000000)
                            // ),
                            color: Color(0xFFD9D9D9),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(2,2),
                                  blurRadius: 0.3
                              )
                            ]
                        ),
                      ),
                    ),
                  ]
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Título',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ExpandableTextField(
                        // controller: titulo,
                        click: () {},
                        height: 0.06,
                        enable: true,
                        hintText: "Churrasquinho Menos é Mais",
                        prefixIcon: Icon(
                          FontAwesomeIcons.masksTheater,
                          size: 16,
                        ))
                  ]
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
                        Text(
                            'Data',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            // controller: data,
                            click: () async {
                              // dataTime = await showDatePicker(
                              //     context: context,
                              //     initialDate: DateTime.now(),
                              //     firstDate: DateTime.now(),
                              //     lastDate:
                              //     DateTime.now().add(Duration(days: 365)));
                              // if (dataTime != null)
                              //   data.text = formatDateTime(dataTime!);
                            },
                            width: 0.42,
                            height: 0.06,
                            enable: true,
                            hintText: "01/01/1970",
                            prefixIcon: Icon(
                              FontAwesomeIcons.solidCalendar,
                              size: 16,
                            ))
                      ]
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Horário',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            // controller: hora,
                            click: () async {
                              // timeOfday = await showTimePicker(
                              //     context: context, initialTime: TimeOfDay.now());
                              // if (timeOfday != null) {
                              //   hora.text = formatTimeOfDay(timeOfday!);
                              // }
                            },
                            width: 0.42,
                            height: 0.06,
                            enable: true,
                            hintText: "13:00",
                            prefixIcon: Icon(
                              FontAwesomeIcons.solidClock,
                              size: 16,
                            ))
                      ]
                  ),
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
                        Text(
                            'Cidade',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            // controller: cidade,
                            click: () {},
                            width: 0.42,
                            height: 0.06,
                            enable: true,
                            hintText: "Campinas",
                            prefixIcon: Icon(
                              FontAwesomeIcons.locationDot,
                              size: 16,
                            ))
                      ]
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'Estado (UF)',
                            textAlign: TextAlign.left,
                            style: TextStyleService.defaultFieldLabel),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.005,
                        ),
                        ExpandableTextField(
                            // controller: uf,
                            click: () {},
                            width: 0.42,
                            height: 0.06,
                            enable: true,
                            hintText: "SP",
                            prefixIcon: Icon(
                              FontAwesomeIcons.locationDot,
                              size: 16,
                            ))
                      ]
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Categoria',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.055,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: Color(0x33000000)
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(2,2),
                                      blurRadius: 0.3
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(Routes.navigatorKey.currentContext!).size.width *
                                    0.03,
                                vertical: 0,
                              ),
                              child: DropdownButton<EventCategory>(
                                // value: selectedCategory,
                                isExpanded: true,
                                isDense: true,
                                underline: SizedBox(height: 0),
                                icon: Icon(
                                    FontAwesomeIcons.angleDown,
                                    size: 18,
                                    color: Colors.grey),
                                style: TextStyleService(
                                    color: Color(0xFF909090)
                                ).defaultTextField,
                                onChanged: (EventCategory? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      // selectedCategory = newValue;
                                    });
                                  }
                                },
                                items: EventCategory.values.map((category) {
                                  return DropdownMenuItem<EventCategory>(
                                      value: category,
                                      child: Text(category.toEnumString(),
                                          style: TextStyleService(
                                              color: Color(0xFF909090)
                                          ).defaultTextField
                                      )
                                  );
                                }
                                ).toList(),
                              ),
                            )
                        )
                    ),
                  ]
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Status',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.055,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: Color(0x33000000)
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(2,2),
                                      blurRadius: 0.3
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                MediaQuery.of(Routes.navigatorKey.currentContext!).size.width *
                                    0.03,
                                vertical: 0,
                              ),
                              child: DropdownButton<EventCategory>(
                                // value: selectedCategory,
                                isExpanded: true,
                                isDense: true,
                                underline: SizedBox(height: 0),
                                icon: Icon(
                                    FontAwesomeIcons.angleDown,
                                    size: 18,
                                    color: Colors.grey),
                                style: TextStyleService(
                                    color: Color(0xFF909090)
                                ).defaultTextField,
                                onChanged: (EventCategory? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      // selectedCategory = newValue;
                                    });
                                  }
                                },
                                items: EventCategory.values.map((category) {
                                  return DropdownMenuItem<EventCategory>(
                                      value: category,
                                      child: Text(category.toEnumString(),
                                          style: TextStyleService(
                                              color: Color(0xFF909090)
                                          ).defaultTextField
                                      )
                                  );
                                }
                                ).toList(),
                              ),
                            )
                        )
                    ),
                  ]
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Descrição',
                        textAlign: TextAlign.left,
                        style: TextStyleService.defaultFieldLabel),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    ExpandableTextField(
                      // controller: descricao,
                      click: () {},
                      height: 0.08,
                      maxLines: 3,
                      enable: true,
                      // hintText: "Churrasquinho Menos é Mais",
                    )
                  ]
              ),
              SizedBox(
                height: 40,
              ),
              ButtonPadrao(
                  enable: true, delete: false,
                  width: 0.45, text: "Salvar",
                  click:() async {}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
