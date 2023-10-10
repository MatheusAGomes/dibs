import 'package:dibs/private/anuncieIngressoScreen.dart';
import 'package:dibs/private/mainEmpresa.dart';
import 'package:dibs/private/mainScreen.dart';
import 'package:dibs/private/meusIngressosScreen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../main.dart';

import '../shared/service/colorService.dart';

class EstruturaEmpresa extends StatefulWidget {
  int pagina;
  int? Matheu;
  EstruturaEmpresa({this.pagina = 1});
  @override
  _EstruturaEmpresaState createState() => _EstruturaEmpresaState();
}

class _EstruturaEmpresaState extends State<EstruturaEmpresa> {
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
          children: [
            MainEmpresaScreen(),
            MainEmpresaScreen(),
            MainEmpresaScreen()
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.grey.shade300,
              selectedItemColor: ColorService.verde,
              type: BottomNavigationBarType.fixed,

              currentIndex: paginaAtual,
              items: [
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
