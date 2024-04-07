import 'package:base/paginas/vistas_estudiantes/p_4.dart';
import 'package:base/paginas/vistas_estudiantes/p_5.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación entre páginas',
      initialRoute: '/',
      routes: {
        '/': (context) => const PagInicio4(),
        '/pagina6': (context) => const PagInicio5(),
      },
    );
  }
}

