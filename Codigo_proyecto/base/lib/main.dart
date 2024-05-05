
//import 'package:base/funciones_proyecto/select_actividad_estudiante.dart';
//import 'package:base/funciones_proyecto/select_actividad_profe.dart';
import 'package:base/funciones_proyecto/select_proceso.dart';
import 'package:base/paginas/vista_profes/p_3a.dart';
import 'package:base/preferences.dart';
import 'package:flutter/material.dart';
import 'package:base/paginas/vistas_estudiantes/p_3.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
   home: PagInicio3e(),
    );
  }
}
