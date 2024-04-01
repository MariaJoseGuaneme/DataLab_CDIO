import 'package:flutter/material.dart';
import 'package:base/funciones_proyecto/inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PagInicio(), //Acá cambian por el widget que ustedes creen
    );
  }
}

