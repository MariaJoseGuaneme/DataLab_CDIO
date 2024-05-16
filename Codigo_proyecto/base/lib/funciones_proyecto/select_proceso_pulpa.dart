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
import 'package:base/paginas/vistas_estudiantes/p_24_pulpa.dart';
import 'package:base/paginas/vistas_estudiantes/p_25.dart';
import 'package:base/paginas/vistas_estudiantes/p_26.dart';
import 'package:base/paginas/vistas_estudiantes/p_27.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:base/funciones_proyecto/exportar.dart';
class Menu_pulpa extends StatefulWidget {
  const Menu_pulpa({super.key});

  @override
  State<Menu_pulpa> createState() => _Menu();
}

class _Menu extends State<Menu_pulpa> {
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
              const RecepcionPage24_pulpa(); // Cambia a la página de recepción
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
                    onPressed: () {
                      _exportData();
                      calcularYGuardarResultados();
                    }// Acción especial para exportar datos
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
    sendEmail(context);// Implementa la lógica para exportar datos aquí
  }
}

Future<void> calcularYGuardarResultados() async {
  final db = await DatabaseHelper.instance.database;
  final _databaseH = DatabaseHelper.instance;
  //_databaseH.borrarRegistroPractica(); NO DESCOMENTAR, gracias
  final practica1 = await db.query(
      'practica1'); // Obtén todos los datos de la tabla practica1.

  for (var practica in practica1) { // Itera a través de los datos de practica1 y realiza los cálculos.
    double unidadesProducir = practica['unidades_producir'] as double;
    double unidadesEmpaque = practica['unidades_empaque'] as double;
    double P_pulpa = practica['p_pulpa'] as double;
    double P_acido_ascorbico = practica['p_acido_ascorbico'] as double;
    double P_acido_citrico = practica['p_acido_citrico'] as double;
    double P_benzonato_sodio = practica['p_benzonato_sodio'] as double;
    double P_sorbato_potasio = practica['p_sorbato_potasio'] as double;
    double Peso_inicial = practica['peso_inicial'] as double;
    double Peso_escaldado = practica['peso_escaldado'] as double;
    double Peso_cascara = practica['peso_cascara'] as double;
    double Peso_pulpa = practica['peso_pulpa'] as double;
    double Peso_semillas = practica['peso_semillas'] as double;
    double Acidez_1_ml = practica['acidez_1'] as double;
    double Acidez_2_ml = practica['acidez_2'] as double;
    double Perdidas_olla = practica['perdidas_olla'] as double; //peso de la olla sola
    double Peso_pulpa_empacada = practica['peso_pulpa_empacada'] as double;
    double perdidas_olla_empacado = practica['perdidas_olla_empacado']as double; // peso de la olla después de empacar su producto


    double Producto_obtener = unidadesEmpaque * unidadesProducir;
    double cascara_y_semilla = Peso_semillas + Peso_cascara;
    double Rendimiento_fruta;

    if (Peso_inicial > 0) {
      Rendimiento_fruta =
          (Peso_inicial - cascara_y_semilla) * 100 / Peso_inicial;
    } else {
      Rendimiento_fruta = 0;
    }
    double Perdidas_despulpado_gr = (Peso_inicial - cascara_y_semilla) -
        Peso_pulpa;
    double Perdidas_despulpado;
    if ((Peso_inicial - cascara_y_semilla) > 0) {
      Perdidas_despulpado =
          Perdidas_despulpado_gr * 100 / (Peso_inicial - cascara_y_semilla);
    } else {
      Perdidas_despulpado = 0;
    }
    double Perdidas_Escaldado_gr = Peso_inicial-Peso_escaldado;
    double Perdidas_Escaldado;
    if (Peso_escaldado > 0) {
      Perdidas_Escaldado = Perdidas_Escaldado_gr * 100 / Peso_escaldado;
    } else {
      Perdidas_Escaldado = 0;
    }
    double Total_Formulacion;
    if (P_pulpa > 0) {
      Total_Formulacion = (Peso_pulpa * 100) / P_pulpa;
    } else {
      Total_Formulacion = 0;
    }
    double gr_pulpa = (Total_Formulacion * P_pulpa) / 100;
    double gr_acidoAscorbico = (Total_Formulacion * P_acido_ascorbico) / 100;
    double gr_acidoCitrico = (Total_Formulacion * P_acido_citrico) / 100;
    double gr_benzonatoSodio = (Total_Formulacion * P_benzonato_sodio) / 100;
    double gr_sorbatoPotasio = (Total_Formulacion * P_sorbato_potasio) / 100;
    double Fruta_fresca_formulacion;
    if (Perdidas_despulpado > 0) {
      Fruta_fresca_formulacion = gr_pulpa * 100 / Perdidas_despulpado;
    } else {
      Fruta_fresca_formulacion = 0;
    }
    double Fruta_fresca_real;
    if ((100 - Perdidas_Escaldado - Perdidas_despulpado) > 0) {
      Fruta_fresca_real = Fruta_fresca_formulacion * 100 /
          (100 - Perdidas_Escaldado - Perdidas_despulpado);
    } else {
      Fruta_fresca_real = 0;
    }
    double Rendimiento_producto;

    if (Total_Formulacion > 0) {
      Rendimiento_producto = ((Producto_obtener / Total_Formulacion) * 100);
    } else {
      Rendimiento_producto = 0;
    }
    double Acidez1 = ((0.064)*(0.1)*Acidez_1_ml/1.0)*(100);
    double Acidez2 = ((0.064)*(0.1)*Acidez_2_ml/1.0)*(100);
    double Perdidas_empacado_gr = (Total_Formulacion-Peso_pulpa_empacada);
    double Perdidas_empacado;
    if (Total_Formulacion > 0) {
      Perdidas_empacado = Perdidas_empacado_gr*100/Total_Formulacion;
    } else {
      Perdidas_empacado = 0;
    }


    Map<String, dynamic> resultado = {
      // Construye el mapa para el resultado de practica1 que se insertará o actualizará en resultados_practica1.
      'id_grupos': practica['id_grupos'],
      'Producto_obtener': Producto_obtener,
      'cascara_y_semilla': cascara_y_semilla,
      'Rendimiento_fruta': Rendimiento_fruta,
      'Perdidas_despulpado_gr': Perdidas_despulpado_gr,
      'Perdidas_despulpado': Perdidas_despulpado,
      'Perdidas_Escaldado_gr': Perdidas_Escaldado_gr,
      'Perdidas_Escaldado': Perdidas_Escaldado,
      'Total_Formulacion': Total_Formulacion,
      'gr_pulpa': gr_pulpa,
      'gr_acidoAscorbico': gr_acidoAscorbico,
      'gr_acidoCitrico': gr_acidoCitrico,
      'gr_benzonatoSodio': gr_benzonatoSodio,
      'gr_sorbatoPotasio': gr_sorbatoPotasio,
      'Fruta_fresca_formulacion': Fruta_fresca_formulacion,
      'Fruta_fresca_real': Fruta_fresca_real,
      'Rendimiento_producto': Rendimiento_producto,
      'Acidez1' : Acidez1,
      'Acidez2' : Acidez2,
      'Perdidas_empacado_gr' : Perdidas_empacado_gr,
      'Perdidas_empacado' : Perdidas_empacado,
    };

    // Aquí, verifica si el resultado para id_grupos ya existe en resultados_practica1.
    final existente = await db.query(
      '_resultados_practica1',
      where: 'id_grupos = ?',
      whereArgs: [practica['id_grupos']],
    );

    if (existente.isNotEmpty) {
      // Actualiza si ya existe un registro con ese id_grupos.
      await db.update(
        '_resultados_practica1',
        resultado,
        where: 'id_grupos = ?',
        whereArgs: [practica['id_grupos']],
      );
    } else {
      // Inserta un nuevo registro si no existe.
      await db.insert('_resultados_practica1', resultado);
    }
  }
 // await _databaseH.deletePractica(1); // Modificar qué tabla borrar en base_datos
}