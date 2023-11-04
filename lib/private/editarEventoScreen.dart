import 'package:dibs/shared/routes/routes.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/shadowedCard.dart';
import 'package:dibs/widget/textfieldpadrao.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../shared/service/colorService.dart';
import '../widget/bannerIngressoMarketPlace.dart';
import '../widget/modalTransferencia.dart';

class EditarEventoScreen extends StatefulWidget {
  double total;

  EditarEventoScreen({super.key, required this.total});

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
        title: const Text(
          'Editar evento',
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
              const Text('Foto de capa'),
              Container(
                height: 105,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey, width: 1)),
              ),
              const Text('Titulo'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: TextFieldPadrao(
                  click: () {},
                  enable: false,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Data'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFieldPadrao(
                          click: () {},
                          enable: false,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Horário'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFieldPadrao(
                          click: () {},
                          enable: false,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Text('Local'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: TextFieldPadrao(
                  click: () {},
                  enable: false,
                ),
              ),
              const Text('Categoria'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                child: TextFieldPadrao(
                  click: () {},
                  enable: false,
                ),
              ),
              const Text('Descrição'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextFieldPadrao(
                  maxlength: 5,
                  click: () {},
                  enable: false,
                ),
              ),
              const SizedBox(
                height: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}
