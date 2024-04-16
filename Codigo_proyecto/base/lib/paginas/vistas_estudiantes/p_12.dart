import 'package:flutter/material.dart';

class RecepcionPage2 extends StatelessWidget {
  const RecepcionPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(
              maxWidth: 600), // Limita el ancho máximo del contenido
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Recuadro de la recepción
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                color: Colors.green,
                child: const Text(
                  '2. LAVADO',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16.0),
              // Espacio para la descripción
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.green
                    .shade300, // Un tono de verde más claro para la descripción
                child: const Text(
                  'Descripción del proceso de recepción. Aquí va el contenido descriptivo sobre cómo se maneja la recepción en tu proceso.',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
