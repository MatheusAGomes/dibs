import 'package:flutter/material.dart';



import '../shared/functions/utils.dart';
import '../widget/bannerCategoriaEvento.dart';

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
          centerTitle: true,
          title: const Text(
            'Categorias',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
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
                Text(
                  widget.titulo,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.41,
                      shadows: <Shadow>[
                        Shadow(
                            offset: const Offset(1.5, 1.5),
                            color: adjustShade(widget.cordois, 0))
                      ]),
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
