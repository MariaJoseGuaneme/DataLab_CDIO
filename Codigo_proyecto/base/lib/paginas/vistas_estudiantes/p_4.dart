import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universidad del Quindío',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: UniversityPage(),
    );
  }
}

class UniversityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Aquí iría la lógica para manejar el evento al presionar el botón
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logou.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Acciones al presionar 'Revisar Prácticas'
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('REVISAR PRÁCTICAS'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acciones al presionar 'Iniciar Práctica'
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('INICIAR PRÁCTICA'),
            ),
          ],
        ),
      ),
    );
  }
}
