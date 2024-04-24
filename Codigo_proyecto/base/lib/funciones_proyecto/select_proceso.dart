import 'package:base/paginas/vistas_estudiantes/p_11.dart';
import 'package:base/paginas/vistas_estudiantes/p_12.dart';
import 'package:base/paginas/vistas_estudiantes/p_13.dart';
import 'package:base/paginas/vistas_estudiantes/p_14.dart';
import 'package:base/paginas/vistas_estudiantes/p_16.dart';
import 'package:base/paginas/vistas_estudiantes/p_18.dart';
import 'package:base/paginas/vistas_estudiantes/p_20.dart';
import 'package:base/paginas/vistas_estudiantes/p_21.dart';
import 'package:base/paginas/vistas_estudiantes/p_22.dart';
import 'package:base/paginas/vistas_estudiantes/p_23.dart';
import 'package:base/paginas/vistas_estudiantes/p_24.dart';
import 'package:base/paginas/vistas_estudiantes/p_25.dart';
import 'package:base/paginas/vistas_estudiantes/p_26.dart';
import 'package:base/paginas/vistas_estudiantes/p_27.dart';
import 'package:base/paginas/vistas_estudiantes/p_29.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
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
        {
          'title': 'Acondicionamiento',
          'color': const Color.fromARGB(255, 16, 112, 20)
        },
        {
          'title': 'Despulpar',
          'color': const Color.fromARGB(255, 241, 189, 165)
        },
        {
          'title': 'Pesado P/S',
          'color': const Color.fromARGB(255, 255, 206, 141)
        },
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
          'title': 'Control Físico-Químico ',
          'color': const Color.fromARGB(255, 136, 134, 26)
        },
        {
          'title': 'Empacado',
          'color': const Color.fromARGB(255, 245, 236, 107)
        },
        {
          'title': 'Almacenado',
          'color': const Color.fromARGB(255, 238, 235, 87)
        },
        {'title': 'Exportar', 'color': const Color.fromARGB(255, 243, 15, 15)},
      ];

  void _changeContent(String sectionTitle) {
    // Actualiza el estado del widget body dependiendo de la sección
    setState(() {
      switch (sectionTitle) {
        case 'Recepción':
          _currentBody =
              const RecepcionPage(); // Cambia a la página de recepción
          break;
        case 'Lavado':
          _currentBody =
              const RecepcionPage2(); // Cambia a la página de recepción
          break;
        case 'Pesado':
          _currentBody =
              RecepcionPage13(); // Cambia a la página de recepción
          break;
        case 'Desinfección':
          _currentBody =
              const RecepcionPage14(); // Cambia a la página de recepción
          break;
        case 'Escaldado':
          _currentBody =
              const RecepcionPage16(); // Cambia a la página de recepción
          break;
        case 'Enfriamiento':
          _currentBody =
              const RecepcionPage18(); // Cambia a la página de recepción
          break;
        case 'Acondicionamiento':
          _currentBody =
              const RecepcionPage20(); // Cambia a la página de recepción
          break;
        case 'Despulpar':
          _currentBody =
              const RecepcionPage21(); // Cambia a la página de recepción
          break;
        case 'Pesado P/S':
          _currentBody =
              const RecepcionPage22(); // Cambia a la página de recepción
          break;
        case 'Control Físico-Químico':
          _currentBody =
              const RecepcionPage23(); // Cambia a la página de recepción
          break;
        case 'Formulación':
          _currentBody =
              const RecepcionPage24(); // Cambia a la página de recepción
          break;
        case 'Mezclado':
          _currentBody =
              const RecepcionPage25(); // Cambia a la página de recepción
          break;
        case 'Control Físico-Químico ':
          _currentBody =
              const RecepcionPage26(); // Cambia a la página de recepción
          break;
        case 'Empacado':
          _currentBody =
              const RecepcionPage27(); // Cambia a la página de recepción
          break;
        case 'Almacenado':
          _currentBody =
              const RecepcionPage29(); // Cambia a la página de recepción
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
        title: const Text(
          'Proceso de producción',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24), // Ajusta el color a blanco y el tamaño del texto
        ),
        backgroundColor: const Color.fromARGB(
            255, 20, 99, 22), // Color verde específico para el AppBar
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
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ...sections.map((section) {
              // Aplica un estilo diferente al botón 'Exportar'
              if (section['title'] == 'Exportar') {
                return ListTile(
                  title: ElevatedButton.icon(
                    icon: const Icon(Icons.download,
                        color: Colors.white), // Ícono de descarga
                    label: Text(section['title']),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () =>
                        _exportData(), // Acción especial para exportar datos
                  ),
                );
              } else {
                return ListTile(
                  title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: section['color'],
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => _changeContent(section['title']),
                    child: Text(section['title']),
                  ),
                );
              }
            }),
          ],
        ),
      ),
      body: _currentBody,
    );
  }

// Método para manejar la exportación de datos
  void _exportData() {
    // Implementa la lógica para exportar datos aquí
  }
}
