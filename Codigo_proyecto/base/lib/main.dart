import 'package:base/paginas/vista_profes/p_5.dart';
import 'package:base/paginas/vista_profes/p_6.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación entre páginas',
      initialRoute: '/',
      routes: {
        '/': (context) => const PagInicio5(),
        '/pagina6': (context) => const PagInicio6(),
      },
    );
  }
}

