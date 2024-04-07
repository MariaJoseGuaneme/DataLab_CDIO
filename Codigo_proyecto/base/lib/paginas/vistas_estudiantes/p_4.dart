import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const UniversityPage(),
    );
  }
}

class UniversityPage extends StatelessWidget {
  const UniversityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white, // AppBar ahora es de color blanco
        elevation: 0,
      ),
      body: Container(
        color: Colors.white, // El fondo ahora es blanco
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/UQ.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.green, // Fondo verde para el texto
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: const Text(
                  'Seleccionar Actividad',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Letra de color blanco
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Ajustamos el espaciado entre los botones con un Padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Botón azul a la izquierda
                    ElevatedButton(
                      onPressed: () {
                        // Acciones para 'Revisar Prácticas'
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            Colors.blue, // Fondo azul para el botón
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text('REVISAR PRÁCTICAS'),
                    ),
                    const SizedBox(width: 10), // Espacio entre los botones
                    // Botón verde a la derecha
                    ElevatedButton(
                      onPressed: () {
                        // Acciones para 'Iniciar Práctica'
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            Colors.green, // Fondo verde para el botón
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      child: const Text('INICIAR PRÁCTICA'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
