import 'package:dibs/private/mainScreen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../main.dart';

import '../shared/service/colorService.dart';

class EstruturasScreen extends StatefulWidget {
  int pagina;
  int? Matheu;
  EstruturasScreen({this.pagina = 1});
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
          physics: ClampingScrollPhysics(),
          controller: pc,
          onPageChanged: setPaginaAtual,
          children: [MainScreen(), Text('data')],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          backgroundColor: ColorService.azul,
          selectedItemColor: ColorService.dourado,
          type: BottomNavigationBarType.fixed,
          currentIndex: paginaAtual,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Inicio'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
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
    );
  }
}
