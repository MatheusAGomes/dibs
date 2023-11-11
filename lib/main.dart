import 'package:dibs/shared/service/MyPageController.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/auth.dart';
import 'public/auth/auth_screen.dart';
import 'shared/dio/app.interceptor.dart';
import 'shared/routes/routes.dart';
import 'shared/service/colorService.dart';

void main() async {
  dio.interceptors.add(logger);
  dio.interceptors.add(AppInterceptors());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        ChangeNotifierProvider(create: (_) => MyPageIndexProvider()),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Center(
            child: CircularProgressIndicator(
          color: ColorService.verde,
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
