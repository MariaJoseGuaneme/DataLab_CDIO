import 'package:base/paginas/vistas_estudiantes/p_24_refresco.dart';
import 'package:flutter/material.dart';
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
import 'package:base/paginas/vistas_estudiantes/p_28.dart';
import 'package:base/paginas/vistas_estudiantes/p_29.dart';
import 'package:base/paginas/vistas_estudiantes/p_30.dart';
import 'package:base/paginas/vistas_estudiantes/p_31.dart';
import 'package:base/paginas/vistas_estudiantes/p_32.dart';
import 'package:base/paginas/vistas_estudiantes/p_33.dart';
import 'package:base/paginas/vistas_estudiantes/p_34.dart';
import 'package:base/paginas/vistas_estudiantes/p_35.dart';
import 'package:base/paginas/vistas_estudiantes/p_36.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'exportar.dart';

class Menu_refresco extends StatefulWidget {
  const Menu_refresco({super.key});

  @override
  State<Menu_refresco> createState() => _Menu();
}

class _Menu extends State<Menu_refresco> {
  Widget _currentBody = const Center(
    child: Text('Contenido principal aquí'),
  );

  List<Map<String, dynamic>> get sections => [
    {'title': 'Recepción', 'color': const Color.fromARGB(255, 100, 200, 247)},
    {'title': 'Lavado', 'color': const Color.fromARGB(255, 41, 161, 231)},
    {'title': 'Pesado', 'color': const Color.fromARGB(255, 8, 122, 167)},
    {'title': 'Desinfección', 'color': const Color.fromARGB(255, 28, 106, 196)},
    {'title': 'Escaldado', 'color': const Color.fromARGB(255, 50, 196, 69)},
    {'title': 'Enfriamiento', 'color': const Color.fromARGB(255, 34, 133, 42)},
    {'title': 'Acondicionamiento', 'color': const Color.fromARGB(255, 16, 112, 20)},
    {'title': 'Despulpar', 'color': const Color.fromARGB(255, 241, 189, 165)},
    {'title': 'Pesado P/S', 'color': const Color.fromARGB(255, 255, 206, 141)},
    {'title': 'Control Físico-Químico 1', 'color': const Color.fromARGB(255, 255, 184, 126)},
    {'title': 'Formulación', 'color': const Color.fromARGB(255, 233, 165, 101)},
    {'title': 'Ebullición', 'color': const Color.fromARGB(255, 240, 153, 72)},
    {'title': 'Control Físico-Químico 2', 'color': const Color.fromARGB(255, 136, 134, 26)},
    {'title': 'Pesado - Ebullición', 'color': const Color.fromARGB(255, 245, 236, 107)},
    {'title': 'Homogeneizar', 'color': const Color.fromARGB(255, 245, 236, 107)},
    {'title': 'Enfriamiento', 'color': const Color.fromARGB(255, 245, 236, 107)},
    {'title': 'Pesado - Homogeneizado', 'color': const Color.fromARGB(255, 245, 236, 107)},
    {'title': 'Envasar y tapar', 'color': const Color.fromARGB(255, 245, 236, 107)},
    {'title': 'Pesado - Total', 'color': const Color.fromARGB(255, 245, 236, 107)},
    {'title': 'Enfriar y almacenar', 'color': const Color.fromARGB(255, 245, 236, 107)},
    {'title': 'Exportar', 'color': const Color.fromARGB(255, 243, 15, 15)},
  ];

  void _changeContent(String sectionTitle) {
    setState(() {
      switch (sectionTitle) {
        case 'Recepción': _currentBody = const RecepcionPage(); break;
        case 'Lavado': _currentBody = const  RecepcionPage2(); break;
        case 'Pesado': _currentBody = RecepcionPage13(); break;
        case 'Desinfección': _currentBody = RecepcionPage14(); break;
        case 'Escaldado': _currentBody = const RecepcionPage16(); break;
        case 'Enfriamiento': _currentBody = const RecepcionPage18(); break;
        case 'Acondicionamiento': _currentBody = const RecepcionPage20(); break;
        case 'Despulpar': _currentBody = const RecepcionPage21(); break;
        case 'Pesado P/S': _currentBody = const RecepcionPage22(); break;
        case 'Control Físico-Químico 1': _currentBody = const RecepcionPage23(); break;
        case 'Formulación': _currentBody = const RecepcionPage24_refresco(); break;
        case 'Ebullición': _currentBody = const RecepcionPage28(); break;
        case 'Control Físico-Químico 2': _currentBody = const RecepcionPage29(); break;
        case 'Pesado - Ebullición': _currentBody = const RecepcionPage30(); break;
        case 'Homogeneizar': _currentBody = const RecepcionPage31(); break;
        case 'Enfriamiento': _currentBody = const RecepcionPage32(); break;
        case 'Pesado - Homogeneizado': _currentBody = const RecepcionPage33(); break;
        case 'Envasar y tapar': _currentBody = const RecepcionPage34(); break;
        case 'Pesado - Total': _currentBody = const RecepcionPage35(); break;
        case 'Enfriar y almacenar': _currentBody = const RecepcionPage36(); break;
        default: _currentBody = const Center(child: Text('Contenido principal aquí'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Proceso de producción',
          style: TextStyle(
              color: Colors.white,
              fontSize: 28.sp), // Ajusta el color a blanco y el tamaño del texto
        ),
        backgroundColor: const Color.fromARGB(255, 20, 99, 22),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 20, 99, 22),
              ),
              child: Text('Selecciona el proceso', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            ...sections.map((section) {
    if (section['title'] == 'Exportar') {
    return ListTile(
    title: ElevatedButton.icon(
    icon: const Icon(Icons.download,
    color: Colors.white), // Ícono de descarga
    label: Text(section['title']),
    style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.red,
    textStyle:  TextStyle(fontSize: 20.sp),
    ),
    onPressed: () {
      _exportData();
    calcularYGuardarResultados();} // Acción especial para exportar datos
    ),
    );
    } else {
    return  ListTile(
      title: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: section['color'],
          textStyle:  TextStyle(fontSize: 26.sp),
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
    sendEmail(context);
    // Implementa la lógica para exportar datos aquí
  }
}





Future<void> calcularYGuardarResultados() async {
  final db = await DatabaseHelper.instance.database;
  final List<Map<String, dynamic>> practica2 = await db.query('practica2');

  for (var practica in practica2) {
    // Extracción de valores de la práctica
    double unidadesProducir = practica['unidades_producir'] as double;
    double unidadesEmpaque = practica['unidades_empaque'] as double;
    double P_pulpa = practica['p_pulpa'] as double;
    double P_azucar = practica['p_azucar'] as double;
    double P_agua = practica['p_agua'] as double;
    double P_cmc = practica['p_CMC'] as double;
    double P_acido_ascorbico = practica['p_acido_ascorbico'] as double;
    double P_benzonato_sodio = practica['p_benzonato_sodio'] as double;
    double P_sorbato_potasio = practica['p_sorbato_potasio'] as double;
    double Peso_inicial = practica['peso_inicial'] as double;
    double Peso_escaldado = practica['peso_escaldado'] as double;
    double Peso_cascara = practica['peso_cascara'] as double;
    double Peso_pulpa = practica['peso_pulpa'] as double;
    double Peso_semillas = practica['peso_semillas'] as double;
    double Peso_refresco_empacado = practica['peso_refresco_empacado'] as double;
    double Perdidas_olla_empacado = practica['perdidas_olla_empacado'] as double;
    double Perdidas_olla = practica['perdidas_olla'] as double;
    double Peso_ebullicion = practica['peso_ebullicion'] as double;
    double Peso_homogeneizacion = practica['peso_homogenizacion'] as double;
    double Acidez_1_ml = practica['acidez_1'] as double;
    double Acidez_2_ml = practica['acidez_2'] as double;

    // Cálculos intermedios y preparación del mapa de resultados
    double Producto_obtener = unidadesEmpaque * unidadesProducir;
    double cascara_y_semilla = Peso_semillas + Peso_cascara;
    double Total_Formulacion = P_pulpa > 0 ? (Peso_pulpa * 100) / P_pulpa : 0;

    double gr_pulpa = (Total_Formulacion * P_pulpa) / 100;
    double gr_azucar = (Total_Formulacion * P_azucar) / 100;
    double gr_agua = (Total_Formulacion * P_agua) / 100;
    double gr_cmc = (Total_Formulacion * P_cmc) / 100;
    double gr_acidoAscorbico = (Total_Formulacion * P_acido_ascorbico) / 100;
    double gr_benzonatoSodio = (Total_Formulacion * P_benzonato_sodio) / 100;
    double gr_sorbatoPotasio = (Total_Formulacion * P_sorbato_potasio) / 100;

    double Rendimiento_fruta = Peso_inicial > 0 ? (Peso_inicial - cascara_y_semilla) * 100 / Peso_inicial : 0;
    double Perdidas_despulpado_gr = Peso_inicial - cascara_y_semilla - Peso_pulpa;
    double Perdidas_despulpado = (Peso_inicial - cascara_y_semilla) > 0 ? Perdidas_despulpado_gr * 100 / (Peso_inicial - cascara_y_semilla) : 0;
    double Perdidas_Escaldado_gr = Peso_inicial - Peso_escaldado;
    double Perdidas_Escaldado = Peso_escaldado > 0 ? Perdidas_Escaldado_gr * 100 / Peso_escaldado : 0;
    double Perdidas_empacado_gr = Total_Formulacion - Peso_refresco_empacado;
    double Perdidas_empacado = Total_Formulacion > 0 ? Perdidas_empacado_gr * 100 / Total_Formulacion : 0;
    double Rendimiento_producto = Total_Formulacion > 0 ? (Producto_obtener / Total_Formulacion) * 100 : 0;
    double Perdidas_evaporacion_gr = Total_Formulacion - Peso_ebullicion;
    double Perdidas_evaporacion = Total_Formulacion > 0 ? Perdidas_evaporacion_gr * 100 / Total_Formulacion : 0;
    double Perdidas_homogenizado_gr = Peso_ebullicion - Peso_homogeneizacion;
    double Perdidas_homogenizado = Total_Formulacion > 0 ? Perdidas_homogenizado_gr * 100 / Total_Formulacion : 0;
    double Perdidas_olla_gr = Perdidas_olla_empacado-Perdidas_olla;

    double Acidez1 = ((0.064) * (0.1) * Acidez_1_ml / 1.0) * (100);
    double Acidez2 = ((0.064) * (0.1) * Acidez_2_ml / 1.0) * (100);

    Map<String, dynamic> resultado = {
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
      'gr_azucar': gr_azucar,
      'gr_agua': gr_agua,
      'gr_cmc': gr_cmc,
      'gr_acidoAscorbico': gr_acidoAscorbico,
      'gr_benzonatoSodio': gr_benzonatoSodio,
      'gr_sorbatoPotasio': gr_sorbatoPotasio,
      'Rendimiento_producto': Rendimiento_producto,
      'Acidez1': Acidez1,
      'Acidez2': Acidez2,
      'Perdidas_empacado_gr': Perdidas_empacado_gr,
      'Perdidas_empacado': Perdidas_empacado,
      'Perdidas_olla_gr': Perdidas_olla_gr,
      'Perdidas_evaporacion_gr': Perdidas_evaporacion_gr,
      'Perdidas_evaporacion': Perdidas_evaporacion,
      'Perdidas_homogenizado_gr': Perdidas_homogenizado_gr,
      'Perdidas_homogenizado': Perdidas_homogenizado,
      // Agregar más campos si es necesario
    };

    final existente = await db.query(
      '_resultados_practica2',
      where: 'id_grupos = ?',
      whereArgs: [practica['id_grupos']],
    );

    if (existente.isNotEmpty) {
      await db.update('_resultados_practica2', resultado, where: 'id_grupos = ?', whereArgs: [practica['id_grupos']]);
    } else {
      await db.insert('_resultados_practica2', resultado);
    }
  }
}

