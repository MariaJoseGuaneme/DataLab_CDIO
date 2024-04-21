import 'package:flutter/material.dart';

class RecepcionPage17 extends StatelessWidget {
  const RecepcionPage17({super.key});

  @override
  Widget build(BuildContext context) {
    // Controlador para el campo de texto del peso.
    final TextEditingController pesoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingrese el Peso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: pesoController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Peso',
                hintText: 'Escriba el peso aquí',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Captura el valor del peso y lo devuelve a la página anterior.
                Navigator.pop(context, pesoController.text);
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      ),
    );
  }
}
