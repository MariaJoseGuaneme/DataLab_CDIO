import 'package:base/main.dart';
import 'package:base/paginas/vistas_estudiantes/p_11.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Inicializa una variable para mantener el widget actual mostrado en el body
  Widget _currentBody = const Center(
    child: Text('Contenido principal aquí'),
  );
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

  void _changeContent(String sectionTitle) {
    // Actualiza el estado del widget body dependiendo de la sección
    setState(() {
      switch (sectionTitle) {
        case 'Recepción':
          _currentBody =
              const RecepcionPage(); // Cambia a la página de recepción
          break;
        // Añade casos para otras secciones
        default:
          _currentBody = const Center(child: Text('Contenido principal aquí'));
      }
    });
  }

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
                        backgroundColor: section['color'],
                      ),
                      onPressed: () => _changeContent(section['title']),
                      child: Text(section['title']),
                    ),
                  ),
                )),
          ],
        ),
      ),
      body: _currentBody, // Usa la variable de estado para mostrar el contenido
    );
  }
}
