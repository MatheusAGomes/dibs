import 'package:dibs/private/estruturaEmpresa.dart';
import 'package:dibs/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/auth.dart';
import '../../private/estruturaScreen.dart';
import '../../repositories/events-repository.dart';
import '../../shared/service/colorService.dart';
import 'signin.dart';

class AuthScreen extends StatefulWidget {
  final String? possiblelink;
  const AuthScreen(this.possiblelink, {super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    String? link = widget.possiblelink;

    Auth auth = Provider.of(context, listen: false);
    return FutureBuilder(
      future: auth.tentarLoginAutomatico(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SignInScreen();
        } else if (snapshot.error != null) {
          return const SignInScreen();
        } else {
          if (auth.estaAutenticado) {
            return FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (auth.authDecoded!['role'].toString() == 'CLIENT')
                      return EstruturasScreen(
                        pagina: 1,
                        listaDeEventos: snapshot.data![0],
                      );

                    return EstruturaEmpresa(
                      pagina: 0,
                    );
                  } else {
                    return const SignInScreen();
                  }
                },
                future: Future.wait([EventsRepository(dio).getListEvents()]));
          } else {
            return const SignInScreen();
          }
        }
      },
    );
  }
}
