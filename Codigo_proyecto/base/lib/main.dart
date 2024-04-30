
import 'package:base/funciones_proyecto/select_actividad_estudiante.dart';
import 'package:base/funciones_proyecto/select_actividad_profe.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
   home: Select_e(),
    );
  }
}
