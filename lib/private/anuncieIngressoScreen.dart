import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dibs/private/modalMeusIngressosAnuncio.dart';
import 'package:dibs/shared/service/textStyle.dart';
import 'package:dibs/widget/bannerMeuIngresso.dart';
import 'package:flutter/material.dart';



class AnuncieIngressoScreen extends StatefulWidget {
  const AnuncieIngressoScreen({Key? key}) : super(key: key);

  @override
  State<AnuncieIngressoScreen> createState() => _AnuncieIngressoScreenState();
}

class _AnuncieIngressoScreenState extends State<AnuncieIngressoScreen> {
  @override
  void initState() {
    super.initState();
  }

  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
          child: SingleChildScrollView(
            // scrollDirection: null,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anuncie seu ingresso',
                      style: TextStyleService.regularTitle,
                    ),
                    const Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedToggleSwitch<int>.size(
                  current: value,
                  values: const [0, 1],
                  height: 30,
                  indicatorSize: const Size(150, 50),
                  indicatorColor: Colors.white,
                  innerColor: Colors.grey.shade300,
                  customIconBuilder: (context, local, global) {
                    if (local.value == 0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Meus anúncios',
                              style: local.value.isEven
                                  ? TextStyleService.toggleSwitchActiveText
                                  : TextStyleService.toggleSwitchInactiveText),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Vendidos',
                              style: local.value.isEven
                              ? TextStyleService.toggleSwitchInactiveText
                                  : TextStyleService.toggleSwitchActiveText),
                        ],
                      );
                    }
                  },
                  indicatorBorderRadius: BorderRadius.circular(7),
                  borderColor: value.isEven
                      ? Colors.grey.shade300
                      : Colors.grey.shade300,
                  borderRadius: BorderRadiusDirectional.circular(9),
                  //colorBuilder: (i) => i.isEven ? Colors.grey : Colors.grey,
                  onChanged: (i) => setState(() => value = i),
                ),
                const SizedBox(
                  height: 20,
                ),
                value == 0
                    ? Column(
                        children: [
                          InkWell(
                            onTap: () => showModalBottomSheet<void>(
                              isScrollControlled: true,
                              enableDrag: true,
                              isDismissible: true,
                              context: context,
                              builder: (BuildContext context) {
                                return const ModalMeusIngressosAnuncio();
                              },
                            ),
                            child: const Row(children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Novo anúncio',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              )
                            ]),
                          ),
                          const Divider(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: BannerMeuIngresso(
                                    empresa: false,
                                    anuncio: false,
                                    image: const AssetImage(
                                        'assets/images/PericlesEx.png'),
                                    titulo: 'Churrasquinho menos é mais',
                                    data: '20/12/2020',
                                    hora: '19:00',
                                    lote: '1° Lote',
                                    tipo: 'Meia-Entrada',
                                    corBanner: Colors.green,
                                    corDoLote: Colors.green.shade900,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: BannerMeuIngresso(
                                    empresa: false,
                                    anuncio: false,
                                    image: const AssetImage(
                                        'assets/images/PericlesEx.png'),
                                    titulo: 'Churrasquinho menos é mais',
                                    data: '20/12/2020',
                                    hora: '19:00',
                                    lote: '1° Lote',
                                    tipo: 'Meia-Entrada',
                                    corBanner: Colors.green,
                                    corDoLote: Colors.green.shade900,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
