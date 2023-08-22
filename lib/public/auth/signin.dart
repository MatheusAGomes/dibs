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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: Column(children: [
          Center(
            child: Image.asset('assets/images/logoDibs.png'),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  'Usuário',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
