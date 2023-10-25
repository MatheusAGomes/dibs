import 'package:dibs/private/mainEmpresa.dart';
import 'package:dibs/private/meusEventoEmpresaScreen.dart';
import 'package:flutter/material.dart';



import '../shared/service/colorService.dart';

class EstruturaEmpresa extends StatefulWidget {
  int pagina;
  int? Matheu;
  EstruturaEmpresa({super.key, this.pagina = 1});
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
          physics: const ClampingScrollPhysics(),
          controller: pc,
          onPageChanged: setPaginaAtual,
          children: const [
            MainEmpresaScreen(),
            MeusEventosEmpresasScreen(),
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
                  label: 'Eventos',
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
