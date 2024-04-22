import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PagInicio9aRefresco extends StatefulWidget {
  const PagInicio9aRefresco({super.key});

  @override
  State<PagInicio9aRefresco> createState() => _PagInicio9aRefresco();
}

class _PagInicio9aRefresco extends State<PagInicio9aRefresco> {
  // Asumiendo que necesitas mantener un estado de los checkboxes,
  // se puede usar un Map para almacenar si una fruta está seleccionada o no.
  final List<String> frutas = ['Mango', 'Guayaba', 'Mora'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Selecciona la fruta'),
          ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0), // Añade un poco de relleno alrededor del texto
              color: Colors.green, // Establece el color de fondo del contenedor
              width: double.infinity, // Asegura que el contenedor se extienda por toda la anchura disponible
              child: const Text(
                'Frutas disponibles',
                style: TextStyle(
                  color: Colors.white, // Establece el color del texto
                  fontSize: 24.0, // Establece el tamaño del texto
                  fontWeight: FontWeight.bold, // Hace que el texto sea en negrita
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: frutas.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(frutas[index]),
                      onTap: () {
                        // Acción cuando se toca cada fruta, por ejemplo, navegar a otra página o mostrar un mensaje.
                        print('Seleccionada: ${frutas[index]}');
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                // Acción para añadir una nueva fruta
              },
              child: const Text('Añadir fruta'),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/logou.jpg'), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}