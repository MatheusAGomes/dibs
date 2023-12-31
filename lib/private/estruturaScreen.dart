import 'package:dibs/models/events.dart';
import 'package:dibs/private/anuncieIngressoScreen.dart';
import 'package:dibs/private/mainScreen.dart';
import 'package:dibs/private/meusIngressosScreen.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/meuIngressoBanner.dart';
import '../shared/routes/routes.dart';
import '../shared/service/MyPageController.dart';
import '../shared/service/colorService.dart';

class EstruturasScreen extends StatefulWidget {
  int? pagina;
  List<Events>? listaDeEventos;
  List<MeuIngressoBanner>? listaDeIngressos;
  List<MeuIngressoBanner>? meusIngressosVendidos;

  EstruturasScreen(
      {super.key,
      required this.pagina,
      required this.listaDeEventos,
      required this.listaDeIngressos,
      required this.meusIngressosVendidos});
  @override
  _EstruturasScreenState createState() => _EstruturasScreenState();
}

class _EstruturasScreenState extends State<EstruturasScreen> {
  late int paginaAtual;
  late PageController pc;

  @override
  initState() {
    paginaAtual =
        Provider.of<MyPageIndexProvider>(Routes.navigatorKey.currentContext!)
            .pageIndex;
    super.initState();
    pc = PageController(
        initialPage: Provider.of<MyPageIndexProvider>(
                Routes.navigatorKey.currentContext!)
            .pageIndex);
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
          onPageChanged: Provider.of<MyPageIndexProvider>(context).updateIndex,
          children: [
            MainScreen(listaDeEventos: widget.listaDeEventos!),
            MeusIngressosScreen(listaDeIngressos: widget.listaDeIngressos!),
            AnuncieIngressoScreen(
              meusingressosavenda: widget.listaDeIngressos!,
              meusIngressosVendidos: widget.meusIngressosVendidos!,
            )
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
              selectedFontSize: 13,
              unselectedFontSize: 12,
              selectedLabelStyle: TextStyleService.bottomNavigationBar,
              unselectedLabelStyle: TextStyleService.bottomNavigationBar,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.grey.shade300,
              selectedItemColor: ColorService.verde,
              type: BottomNavigationBarType.fixed,

              currentIndex: Provider.of<MyPageIndexProvider>(context).pageIndex,

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      FontAwesomeIcons.house,
                      size: 20,
                    ),
                    label: 'Tela inicial'),
                BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.ticketSimple,
                    size: 20,
                  ),
                  label: 'Ingressos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.dollarSign, size: 20),
                  label: 'Vendas',
                ),
              ],
              onTap: (pagina) {
                Provider.of<MyPageIndexProvider>(context, listen: false)
                    .updatePc(pagina, pc);
              },
              // backgroundColor: Colors.grey[100],
            ),
          ),
        ),
      ),
    );
  }
}
