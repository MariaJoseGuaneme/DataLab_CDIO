import 'package:flutter/material.dart';

class RecepcionPage extends StatelessWidget {
  const RecepcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recepción'),
      ),
      body: const Center(
        child: Text('Bienvenido a la página de Recepción'),
      ),
    );
  }
}
