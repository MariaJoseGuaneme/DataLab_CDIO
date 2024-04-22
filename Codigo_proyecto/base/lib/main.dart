import 'package:base/funciones_proyecto/inicio.dart';
import 'package:base/funciones_proyecto/select_actividad_estudiante.dart';
import 'package:base/funciones_proyecto/select_proceso.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: PagInicio(),
      //home: Select_e(),
      home: Menu(),
    );
  }
}
