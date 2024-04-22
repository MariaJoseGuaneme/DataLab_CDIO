import 'package:flutter/material.dart';

class RecepcionPage25 extends StatelessWidget {
  const RecepcionPage25({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          // Imagen en la esquina superior izquierda
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/UQ.png',
              width: 200, // Puedes ajustar el tamaño según necesites
              height: 200,
            ),
          ),
          // Contenido centrado en la página
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              constraints: const BoxConstraints(
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
                      '13. MEZCLADO',
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
                      'Descripción del proceso de mezclado. Aquí va el contenido descriptivo sobre cómo se maneja el mezclado en tu proceso.',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
