import 'package:dibs/models/events.dart';
import 'package:dibs/private/anuncieIngressoScreen.dart';
import 'package:dibs/private/mainScreen.dart';
import 'package:dibs/private/meusIngressosScreen.dart';
import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class EstruturasScreen extends StatefulWidget {
  int? pagina;
  List<Events>? listaDeEventos;
  EstruturasScreen(
      {super.key, required this.pagina, required this.listaDeEventos});
  @override
  _EstruturasScreenState createState() => _EstruturasScreenState();
}

class _EstruturasScreenState extends State<EstruturasScreen> {
  late int paginaAtual;
  late PageController pc;

  @override
  initState() {
    paginaAtual = 0;
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    pc = PageController(initialPage: paginaAtual);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: PageView(
          physics: const ClampingScrollPhysics(),
          controller: pc,
          onPageChanged: setPaginaAtual,
          children: [
            MainScreen(listaDeEventos: widget.listaDeEventos!),
            MeusIngressosScreen(),
            AnuncieIngressoScreen()
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.grey.shade300,
              selectedItemColor: ColorService.verde,
              type: BottomNavigationBarType.fixed,

              currentIndex: paginaAtual,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Tela inicial'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.confirmation_num),
                  label: 'Ingresso',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money),
                  label: 'Vendas',
                ),
              ],
              onTap: (pagina) {
                pc.animateToPage(
                  pagina,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
              // backgroundColor: Colors.grey[100],
            ),
          ),
        ),
      ),
    );
  }
}
