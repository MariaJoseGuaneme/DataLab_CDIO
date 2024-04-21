import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecepcionPage22 extends StatelessWidget {
  const RecepcionPage22({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/UQ.png',
              width: 200,
              height: 200,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      color: Colors.green,
                      child: const Text(
                        '10. PESADO P/S',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child: const Text(
                        'Descripción del proceso de acondicionamiento. Aquí va el contenido descriptivo sobre cómo se maneja el acondicionamiento en tu proceso.',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Ingrese el peso de la pulpa',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Peso de la pulpa',
                        hintText: 'Introduzca el peso en kilogramos',
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\,?\d*')),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    // Nuevo texto de etiqueta para el segundo cuadro de texto
                    const Text(
                      'Ingrese el peso las semillas',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    // Segundo cuadro de texto
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Peso de las semillas',
                        hintText: 'Introduzca el peso final en kilogramos',
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\,?\d*')),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
