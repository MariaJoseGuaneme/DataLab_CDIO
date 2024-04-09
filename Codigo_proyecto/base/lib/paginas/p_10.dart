import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proceso de producción',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Map<String, dynamic>> get sections => [
        {
          'title': 'Recepción',
          'color': const Color.fromARGB(255, 100, 200, 247)
        },
        {'title': 'Lavado', 'color': const Color.fromARGB(255, 41, 161, 231)},
        {'title': 'Pesado', 'color': const Color.fromARGB(255, 8, 122, 167)},
        {
          'title': 'Desinfección',
          'color': const Color.fromARGB(255, 28, 106, 196)
        },
        {'title': 'Escaldado', 'color': const Color.fromARGB(255, 50, 196, 69)},
        {
          'title': 'Enfriamiento',
          'color': const Color.fromARGB(255, 34, 133, 42)
        },
        {'title': 'Pesado', 'color': const Color.fromARGB(255, 10, 117, 37)},
        {
          'title': 'Acondicionamiento',
          'color': const Color.fromARGB(255, 16, 112, 20)
        },
        {
          'title': 'Despulpar',
          'color': const Color.fromARGB(255, 241, 189, 165)
        },
        {'title': 'Pesado', 'color': const Color.fromARGB(255, 255, 206, 141)},
        {
          'title': 'Control Físico-Químico',
          'color': const Color.fromARGB(255, 255, 184, 126)
        },
        {
          'title': 'Formulación',
          'color': const Color.fromARGB(255, 233, 165, 101)
        },
        {'title': 'Mezclado', 'color': const Color.fromARGB(255, 240, 153, 72)},
        {
          'title': 'Control Físico-Químico',
          'color': const Color.fromARGB(255, 245, 243, 163)
        },
        {
          'title': 'Empacado',
          'color': const Color.fromARGB(255, 245, 236, 107)
        },
        {
          'title': 'Almacenado',
          'color': const Color.fromARGB(255, 238, 235, 87)
        },
        {'title': 'Pérdidas', 'color': const Color.fromARGB(255, 235, 222, 49)},
        {
          'title': 'Datos adicionales',
          'color': const Color.fromARGB(255, 230, 202, 43)
        },
      ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proceso de producción'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 99, 22),
              ),
              child: Text('Selecciona el proceso',
                  style: TextStyle(color: Colors.white)),
            ),
            ...sections.map((section) => Container(
                  color: section['color'],
                  child: ListTile(
                    title: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 231, 228, 228),
                        backgroundColor: section['color'], // Text color
                      ),
                      onPressed: () {
                        // Handle the button press
                        if (kDebugMode) {
                          print('${section['title']} presionado');
                        }
                      },
                      child: Text(section['title']),
                    ),
                  ),
                )),
            ListTile(
              title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red, // Text color
                ),
                onPressed: () {
                  // Handle the export action
                  if (kDebugMode) {
                    print('Exportar');
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Exportar'),
                    Icon(Icons.download),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Contenido principal aquí'),
      ),
    );
  }
}
