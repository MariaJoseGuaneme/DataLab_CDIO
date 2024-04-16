import 'package:flutter/material.dart';


class PagInicio6 extends StatefulWidget {
  const PagInicio6({super.key});

  @override
  State<PagInicio6> createState() => _PagInicio6();
}

class _PagInicio6 extends State<PagInicio6> {
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
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2,
              crossAxisSpacing: 20, // Espacio entre columnas
              mainAxisSpacing: 20, // Espacio entre filas
              childAspectRatio: buttonAspectRatio,
              children: <Widget>[
                _buildPracticaButton(context, 'PULPA', const Color.fromARGB(255, 16, 8, 169)),
                _buildPracticaButton(context, 'REFRESCO', const Color.fromARGB(255, 13, 71, 161)),
                _buildPracticaButton(context, 'NÉCTAR', const Color.fromARGB(255, 38, 134, 45)),
                _buildPracticaButton(context, 'MERMELADA', const Color.fromARGB(255, 56, 142, 60)),
                _buildPracticaButton(context, 'BOCADILLO', const Color.fromARGB(255, 26, 115, 232)),
                _buildPracticaButton(context, 'FRUTAS EN ALMIBAR', const Color.fromARGB(255, 2, 136, 209)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticaButton(BuildContext context, String etiqueta, Color color) {
    return Padding(
      padding: const EdgeInsets.all(20), // Añade padding alrededor del botón para más espacio
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: color, // Color del texto del botón
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Ajusta el padding dentro del botón
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Manejar la pulsación del botón
        },
        child: Text(etiqueta),
      ),
    );
  }
}
