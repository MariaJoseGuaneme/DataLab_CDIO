import 'package:base/paginas/vista_profes/p_9aPulpa.dart';
import 'package:base/paginas/vista_profes/p_9aRefresco.dart';
import 'package:flutter/material.dart';

class PagInicio9 extends StatefulWidget {
  const PagInicio9({super.key});

  @override
  State<PagInicio9> createState() => _PagInicio9();
}

class _PagInicio9 extends State<PagInicio9> {
  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    var size = MediaQuery.of(context).size;
    
    // Ajusta la relación de aspecto según el diseño deseado
    double buttonWidth = size.width / 2.0;
    double buttonHeight = buttonWidth / 2.0; // Hacer el botón cuadrado o cerca de esa proporción
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
          const Spacer(),
          Expanded(
            flex: 2,
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              crossAxisSpacing: 20, // Espacio entre columnas
              mainAxisSpacing: 20, // Espacio entre filas
              childAspectRatio: buttonAspectRatio,
              children: <Widget>[
                _buildPracticaButton(context, 'PULPA', Color.fromARGB(255, 57, 174, 247), () 
                {Navigator.push(context, MaterialPageRoute(builder: (context) => const PagInicio9aPulpa()));}),
                _buildPracticaButton(context, 'REFRESCO', const Color.fromARGB(255, 13, 71, 161), () 
                {Navigator.push(context, MaterialPageRoute(builder: (context) => const PagInicio9aRefresco()));}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticaButton(BuildContext context, String etiqueta, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(20), // Añade padding alrededor del botón para más espacio
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: color, // Color del texto del botón
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Ajusta el padding dentro del botón
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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