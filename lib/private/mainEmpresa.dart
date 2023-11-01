import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerPrincipal.dart';
import 'package:dibs/widget/modalAjuda.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
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
                                  const Text('Foto de capa'),
                                  Container(
                                    height: 105,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                  ),
                                  const Text('Titulo'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
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
                                          const Text('Data'),
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
                                              enable: false,
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
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  const Text('Categoria'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: TextFieldPadrao(
                                      click: () {},
                                      enable: false,
                                    ),
                                  ),
                                  const Text('Descrição'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
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
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: const Color(0xFF198A68),
                                        ),
                                        width: 140,
                                        height: 40,
                                        child: const Center(
                                          child: Text(
                                            'Salvar',
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
                const Text('Proximo Evento',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  child: BannerPrincipal(
                    empresa: true,
                    id: '1',
                    height: 200,
                    width: 400,
                    image: const AssetImage('assets/images/PericlesEx.png'),
                    titulo: 'Churrasquinho Menos é Mais',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Text(
                  'Lotes ativos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  'Camarote - 4° Lote',
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
                Stack(
                  children: [
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width * 0.875,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      barRadius: const Radius.circular(5),
                      percent: 0.8,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: const Color(0xFF198A68),
                      backgroundColor: const Color(0xFFDADADA),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Inteira',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('50/100',
                              style: TextStyle(color: Color(0xFF8D8D8D))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Stack(
                  children: [
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width * 0.875,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      barRadius: const Radius.circular(5),
                      percent: 0.4,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: const Color(0xFF10B981),
                      backgroundColor: const Color(0xFFDADADA),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Meia', style: TextStyle(color: Colors.white)),
                          Text('40/100',
                              style: TextStyle(color: Color(0xFF8D8D8D))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Text(
                  'Ingressos totais vendidos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                LinearPercentIndicator(
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width * 0.875,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  barRadius: const Radius.circular(5),
                  percent: 0.849,
                  center: const Text(
                    '849/1000',
                    style: TextStyle(color: Colors.white),
                  ),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: const Color(0xFF198A68),
                  backgroundColor: const Color(0xFFDADADA),
                ),
              ],
            )),
          ),
        ));
  }
}
