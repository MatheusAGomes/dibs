import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/routes/routes.dart';

import '../../../shared/service/colorService.dart';
import '../../../shared/store.dart';
import '../../models/auth.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/logoDibs.png'),
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 34,
                  width: 343,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    controller: buscaController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Busque eventos',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(children: [
                  Positioned(
                    right: 69,
                    child: Row(
                      children: [
                        Text(
                          'Eventos mais procurados',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Color(0xff7EF4D1)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Eventos mais procurados',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ],
                  ),
                ])
              ],
            ),
          ),
        ));
  }
}
