import 'package:flutter/material.dart';
import 'package:base/funciones_proyecto/select_proceso_pulpa.dart';
import 'package:base/funciones_proyecto/select_proceso_refresco.dart';

import '../../preferences.dart';
class PagInicio5 extends StatefulWidget {
  const PagInicio5({super.key});

  @override
  State<PagInicio5> createState() => _PagInicio5();
}

class _PagInicio5 extends State<PagInicio5> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double buttonWidth = size.width / 2.0;
    double buttonHeight = buttonWidth / 2.0;
    double buttonAspectRatio = buttonWidth / buttonHeight;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos de la columna verticalmente
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 21, 110, 34),
            width: double.infinity,
            child: const Text(
              'Selecciona la práctica',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: buttonAspectRatio,
                children: <Widget>[
                  _buildPracticaButton(context, 'PULPA', const Color.fromARGB(255, 16, 8, 169), () async {
                    await UserPreferences.setPracticaSeleccionada('practica1'); // Guarda 'practica1' para PULPA
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu_pulpa()));
                  }),
                  _buildPracticaButton(context, 'REFRESCO', const Color.fromARGB(255, 13, 71, 161), () async {
                    await UserPreferences.setPracticaSeleccionada('practica2'); // Guarda 'practica2' para REFRESCO
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu_refresco()));// Navegación a la página de refresco
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticaButton(BuildContext context, String etiqueta, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(etiqueta),
      ),
    );
  }
}
