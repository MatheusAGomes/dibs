import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../shared/functions/utils.dart';
import '../shared/service/textStyle.dart';
import '../widget/bannerCategoriaEvento.dart';
import '../widget/meuPerfil.dart';
import '../widget/modalMeusCartoes.dart';

class CategoriaScreen extends StatefulWidget {
  Color cor;
  Color cordois;
  String titulo;
  CategoriaScreen(this.cor, this.titulo, this.cordois, {super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: adjustShade(widget.cordois, 120),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Categorias',
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.titulo,
                    style: TextStyleService(categoryShadow: <Shadow>[
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          color: Color.fromRGBO(126, 244, 209, 0.72))
                    ], fontSize: 22).corSublinhada),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                BannerCategoriaEvento(
                  titulo: 'Churrasquinho menos é mais',
                  corUm: widget.cor,
                  corDois: widget.cordois,
                  data: '02/02/2020',
                  hora: '20:00',
                  image: const AssetImage('assets/images/PericlesEx.png'),
                )
              ],
            )),
          ),
        ));
  }
}
