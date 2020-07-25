import 'package:flutter/material.dart';
import 'package:rancho_no_supermercado/views/loging_view.dart';
import 'package:rancho_no_supermercado/views/main_view.dart';
import 'package:rancho_no_supermercado/views/opening_view.dart';
import 'package:rancho_no_supermercado/views/register_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String openingView = '/opening-view';
  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String mainView = '/main-view';

  static Map<String, WidgetBuilder> define() {
    return {
      openingView: (context) => OpeningView(),
      authLogin: (context) => LoginView(),
      authRegister: (context) => RegisterView(),
      mainView: (context) => MainView(),
    };
  }
}
