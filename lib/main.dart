import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rancho_no_supermercado/services/auth_notifier.dart';
import 'package:rancho_no_supermercado/services/produto_notifier.dart';
import 'package:rancho_no_supermercado/views/loging_view.dart';
import 'package:rancho_no_supermercado/views/main_view.dart';
import 'package:rancho_no_supermercado/views/opening_view.dart';
import 'package:rancho_no_supermercado/views/register_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // fixa o aplicativo em modo retrato
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff560027),
        accentColor: Color(0xffbc477b),
        brightness: Brightness.dark,
      ),
      title: 'Rancho no Supermercado',
      initialRoute: '/',
      routes: {
        '/': (context) => OpeningView(),
        '/loginView': (context) => LoginView(),
        '/registerView': (context) => RegisterView(),
        '/mainView': (context) => MainView(),
      },
    );
  }
}
