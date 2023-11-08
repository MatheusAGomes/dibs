import 'package:dibs/private/estruturaEmpresa.dart';
import 'package:dibs/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/auth.dart';
import '../../private/estruturaScreen.dart';
import '../../repositories/events-repository.dart';
import '../../repositories/ticket-repository.dart';
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

    Auth auth = Provider.of(context);
    return FutureBuilder(
      future: auth.tentarLoginAutomatico(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        } else if (snapshot.error != null) {
          return SignInScreen();
        } else {
          if (auth.estaAutenticado) {
            if (auth.authDecoded!['role'].toString() == 'CLIENT') {
              return FutureBuilder<dynamic>(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return EstruturasScreen(
                        pagina: 1,
                        listaDeEventos: snapshot.data[0],
                        listaDeIngressos: snapshot.data[1],
                        meusIngressosVendidos: snapshot.data[2],
                      );
                    } else {
                      return SignInScreen();
                    }
                  },
                  future: Future.wait([
                    EventsRepository(dio).getListEvents(),
                    TicketRepository(dio).getTickets(),
                    TicketRepository(dio).getSoldTickets()
                  ]));
            } else {
              return EstruturaEmpresa(
                pagina: 0,
              );
            }
          } else {
            return SignInScreen();
          }
        }
      },
    );
  }
}
