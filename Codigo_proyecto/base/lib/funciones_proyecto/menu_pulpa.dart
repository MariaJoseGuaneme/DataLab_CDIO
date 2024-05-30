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
import 'package:base/paginas/vistas_estudiantes/p_24_pulpa.dart';
import 'package:base/paginas/vistas_estudiantes/p_25.dart';
import 'package:base/paginas/vistas_estudiantes/p_26.dart';
import 'package:base/paginas/vistas_estudiantes/p_27.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base/paginas/Revisar_practicas.dart';
import 'package:base/funciones_proyecto/exportar.dart';
import '../paginas/vistas_estudiantes/p_5.dart';
import '../preferences.dart';

class MenuPulpaReal extends StatefulWidget {
  const MenuPulpaReal({Key? key}) : super(key: key);

  @override
  _MenuPulpaRealState createState() => _MenuPulpaRealState();
}

class _MenuPulpaRealState extends State<MenuPulpaReal> {
  String practica = UserPreferences
      .getPracticaSeleccionada(); // Identificador de la práctica
  final List<Map<String, dynamic>> processes = [
    {'title': '1. \nRecepción', 'color': Colors.blue[300]},
    {'title': '2. \nLavado', 'color': Colors.blue[500]},
    {'title': '3. \nPesado Inicial', 'color': Colors.blue[700]},
    {'title': '4. \nDesinfección', 'color': Colors.blue[900]},
    {'title': '5. \nEscaldado', 'color': Colors.green[300]},
    {'title': '6. \nEnfriamiento', 'color': Colors.green[500]},
    {'title': '7. \nAcondicionamiento', 'color': Colors.green[900]},
    {'title': '8. \nDespulpado', 'color': Colors.orange[300]},
    {'title': '9. \nPesado Oficial', 'color': Colors.orange[500]},
    {'title': '10. \nControl F/Q 1', 'color': Colors.orange[700]},
    {'title': '11. \nFormulación', 'color': Colors.orange[900]},
    {'title': '12. \nMezclado', 'color': Colors.red[300]},
    {'title': '13. \nControl F/Q 2', 'color': Colors.red[500]},
    {'title': '14. \nEmpacado', 'color': Colors.red[700]},
    {'title': 'Exportar', 'color': Colors.black},
  ];

  void navigateToPage(String title) async {
    if ('11. \nFormulación' == title) {
      // Ejecutar cálculos y recarga antes de cambiar al cuerpo de la página.
      await calcularYGuardarResultados();
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (_) =>
            RecepcionPage24_pulpa()));
      });
    } else {
      setState(() {
    switch (title) {
      case '1. \nRecepción':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage()));
        break;
      case '2. \nLavado':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage2()));
        break;
      case '3. \nPesado Inicial':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage13()));
        break;
      case '4. \nDesinfección':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage14()));
        break;
      case '5. \nEscaldado':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage16()));
        break;
      case '6. \nEnfriamiento':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage18()));
        break;
      case '7. \nAcondicionamiento':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage20()));
        break;
      case '8. \nDespulpado':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage21()));
        break;
      case '9. \nPesado Oficial':
        Navigator.push(context, MaterialPageRoute(builder: (_) =>
            RecepcionPage22())); // Cambia a la página de recepción
        break;
      case '10. \nControl F/Q 1':
        Navigator.push(context, MaterialPageRoute(builder: (_) =>
            RecepcionPage23())); // Cambia a la página de recepción
        break;
      case '12. \nMezclado':
        Navigator.push(context, MaterialPageRoute(builder: (_) =>
            RecepcionPage25())); // Cambia a la página de recepción
        break;
      case '13. \nControl F/Q 2':
        Navigator.push(context, MaterialPageRoute(builder: (_) =>
            RecepcionPage26())); // Cambia a la página de recepción
        break;
      case '14. \nEmpacado':
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RecepcionPage27()));
        break;
      default:
        Center(child: SizedBox(
          width: 400,
          height: 400,
          child: Image.asset('assets/logou.jpg'),
        ),
        );
        break;
    }
      }
      );
    }
  }

// Define las páginas a las que se redirigirá
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => PagInicio5())),
        ),
        title: Text('Selección del proceso', style: TextStyle(fontSize: 32.sp),),
        actions: [
          InkWell(
            onTap: showHelpDialog,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ayuda', style: TextStyle(fontSize: 26.sp)),
                SizedBox(width: 4.w),
                Icon(Icons.help_outline, size: 46.sp),
              ],
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: ListView.builder(
        itemCount: (processes.length / 2).ceil(),
        itemBuilder: (BuildContext context, int index) {
          int firstIndex = index * 2;
          int secondIndex = firstIndex + 1;
          return Row(
            children: [
              Expanded(
                child: processTile(processes[firstIndex], context,firstIndex),
              ),
              if (secondIndex < processes.length)
                Expanded(
                  child: processTile(processes[secondIndex], context,secondIndex),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget processTile(Map<String, dynamic> process, BuildContext context, index) {
    if (process['title'] == 'Exportar') {
      return ListTile(
        title: ElevatedButton.icon(
            icon: const Icon(Icons.download, color: Colors.white),
            label: Text(process['title']),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: process['color'],
              textStyle: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Scaffold(
                        appBar: AppBar(
                          title: Text('Pre-Visualización'),
                          backgroundColor: Color.fromARGB(255, 59, 148, 61),
                          actions: <Widget>[
                            ElevatedButton.icon(
                                icon: const Icon(
                                    Icons.send, color: Colors.white),
                                label: Text('Enviar'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                  textStyle: TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  // Mostrar un SnackBar inicial indicando que el envío está en progreso
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Enviando...'),
                                        duration: Duration(
                                            hours: 1), // Un tiempo largo para asegurar que permanezca visible
                                      )
                                  );

                                  // Llamar a la función sendEmail y esperar los resultados
                                  List<bool> emailResults = await sendEmail(
                                      context, practica);

                                  // Remover el SnackBar "Enviando..."
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();

                                  // Mostrar SnackBar basado en resultados
                                  if (emailResults.every((result) =>
                                  result == true)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(
                                            'Todos los correos fueron enviados con éxito'))
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(
                                            'Uno o más correos fallaron'))
                                    );
                                  }
                                  // Cierra la vista después de mostrar los SnackBars
                                  Navigator.of(context).pop();
                                }
                            ),
                          ],
                        ),
                        body:ExcelViewerPage(practica: practica),
                      ),
                ),
              );
              calcularYGuardarResultados();
            }
        ),
      );
    } else {
      return InkWell( // Utiliza InkWell para manejar los eventos de toque
        onTap: () {
          navigateToPage(processes[index]['title']); // Llama a la función de navegación cuando se toca el container
        },
        child: Container(
          color: process['color'],
          height: 130.h, // Asegúrate de que la altura esté definida correctamente según tus especificaciones de diseño
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos verticalmente
              children: [
                Text(
                  process['title'],
                  style: TextStyle(color: Colors.white, fontSize: 36.sp), // Asegúrate de que el tamaño del texto se ajuste correctamente
                  textAlign: TextAlign.center, // Centra el texto horizontalmente
                ),
              ],
            ),
          ),
        ),
      );
    }


  }

  void showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ayuda:'),
          content: Text('Estás en el menú principal de la práctica pulpa, aquí podrás:\n 1. Seleccionar el proceso \n 2. Insertar datos \n 3. Modificar datos \n 4. Observar la formulación \n 5. Previsualizar los datos \n 6. Enviar los datos\n\n\n Para comenzar, dale click al sección de Recepción'),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ],
        );
      },
    );
  }
}

Future<void> calcularYGuardarResultados() async {
  final db = await DatabaseHelper.instance.database;
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
// Añade clases para las demás páginas siguiendo el ejemplo de RecepcionPage
