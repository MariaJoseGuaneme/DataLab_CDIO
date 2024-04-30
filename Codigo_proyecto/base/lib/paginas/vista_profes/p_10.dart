import 'package:base/paginas/vista_profes/p_11.dart';
import 'package:base/paginas/vista_profes/p_12.dart';
import 'package:base/paginas/vista_profes/p_13.dart';
import 'package:flutter/material.dart';

class PagInicio10 extends StatefulWidget {
  const PagInicio10({Key? key}) : super(key: key);

  @override
  State<PagInicio10> createState() => _PagInicio10State();
}

class _PagInicio10State extends State<PagInicio10> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/UQ.png',
              width: 200,
              height: 200,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
              padding: const EdgeInsets.all(8.0), // Añade un poco de relleno alrededor del texto
              color: Colors.green, // Establece el color de fondo del contenedor
              width: double.infinity, // Asegura que el contenedor se extienda por toda la anchura disponible
              child: const Text(
                'Selecciona el tipo de información',
                style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 30.0, // Establece el tamaño del texto
                  fontWeight: FontWeight.bold, // Hace que el texto sea en negrita
                ),
                textAlign: TextAlign.center,
              ),
            ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(150.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, // Esto asegura que los elementos hijos se estiren a lo ancho
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio11()),);
                  },
                  child: const Text(
                    'FORMULACIÓN',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    fixedSize: const Size(150, 100), // Tamaño de los botones
                  ),
                ),
                const SizedBox(height: 100), // Espacio entre los botones
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio12()),);// Acción para DATOS BASE
                  },
                  child: const Text(
                    'DATOS BASE',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(150, 100), // Tamaño de los botones
                  ),
                ),
                const SizedBox(height: 100), // Espacio entre los botones
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio13()),);// Acción para TIEMPOS
                  },
                  child: const Text(
                    'TIEMPOS',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 20, 224, 211),
                    fixedSize: const Size(150, 100), // Tamaño de los botones
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
