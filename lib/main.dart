import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

import 'models/auth.dart';
import 'public/auth/auth_screen.dart';
import 'shared/routes/routes.dart';
import 'shared/service/colorService.dart';

void main() {
  runApp(const MyApp());
}

Dio dio = Dio();
final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 90);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Routes routes = Routes();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth(dio)),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
            child: CircularProgressIndicator(
          color: ColorService.azul,
        )),
        child: MaterialApp(
          navigatorKey: Routes.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Dibs',
          theme: ThemeData(
            textTheme: GoogleFonts.jostTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          routes: routes.routes,
          home: AuthScreen(null),
        ),
      ),
    );
  }
}
