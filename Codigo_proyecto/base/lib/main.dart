
//import 'package:base/funciones_proyecto/select_actividad_estudiante.dart';
import 'package:base/funciones_proyecto/select_proceso.dart';
import 'package:base/paginas/vista_profes/p_3a.dart';
import 'package:flutter/material.dart';
import 'package:base/paginas/vista_profes/p_9aPulpa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
   home: PagInicio3a(),
    );
  }
}
