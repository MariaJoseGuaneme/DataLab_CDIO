import 'package:flutter/material.dart';
import 'package:base/funciones_proyecto/inicio.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PagInicio(),
    );
  }
}

