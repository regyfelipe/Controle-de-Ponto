import 'package:flutter/material.dart';
import 'package:pontosyn/screens/home_screen.dart';
import '../screens/bate_ponto_screen.dart';
import '../screens/registro_batida.dart';
// import '../screens/configuracoes_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String batePonto = '/batePonto';
  static const String registroBatida = '/registroBatida';
  static const String configuracoes = '/configuracoes'; 

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomeScreen(),
    batePonto: (context) => BatePontoScreen(),
    registroBatida: (context) => RegistroBatidaScreen(),
    // configuracoes: (context) => ConfiguracoesScreen(), 
  };
}
