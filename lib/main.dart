import 'package:flutter/material.dart';
import 'screens/bate_ponto_screen.dart';
import 'screens/registro_batida.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Ponto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/batePonto', 
      routes: {
        '/batePonto': (context) => const BatePontoScreen(),
        '/registroBatida': (context) => const RegistroBatidaScreen(),
        // '/configuracoes': (context) => ConfiguracoesScreen(),
      },
    );
  }
}
