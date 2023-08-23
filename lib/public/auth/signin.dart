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

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
  }

  int value = 0;
  TextEditingController usuarioController = TextEditingController();

  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: Image.asset('assets/images/logoDibs.png'),
          ),
          SizedBox(
            height: 23,
          ),
          AnimatedToggleSwitch<int>.size(
            current: value,
            values: [0, 1],
            height: 30,
            indicatorSize: Size(130, 50),
            indicatorColor: Colors.white,
            innerColor: Colors.grey.shade300,
            customIconBuilder: (context, local, global) {
              if (local.value == 0)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cliente',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                );
              else
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Empresa',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                );
            },
            indicatorBorderRadius: BorderRadius.circular(7),
            borderColor:
                value.isEven ? Colors.grey.shade300 : Colors.grey.shade300,
            borderRadius: BorderRadiusDirectional.circular(9),
            //colorBuilder: (i) => i.isEven ? Colors.grey : Colors.grey,
            onChanged: (i) => setState(() => value = i),
          ),
          SizedBox(
            height: 65,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Usuário',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Container(
                  height: 34,
                  width: 343,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    controller: usuarioController,
                    decoration: InputDecoration(
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
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Senha',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Container(
                  height: 34,
                  width: 343,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    controller: senhaController,
                    decoration: InputDecoration(
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
                  height: 120,
                ),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Color(0XFF198A68),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color(0XFF198A68)),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1.5, color: Color(0XFF198A68)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
