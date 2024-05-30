import 'package:base/paginas/vistas_estudiantes/p_23.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/menu_pulpa.dart';
import '../../preferences.dart';// Asegúrate de importar el DatabaseManager

class RecepcionPage22 extends StatefulWidget {
  const RecepcionPage22({super.key});

  @override
  _RecepcionPage22State createState() => _RecepcionPage22State();
}

class _RecepcionPage22State extends State<RecepcionPage22> {
  final TextEditingController _pesoPulpaController = TextEditingController();
  final TextEditingController _pesoSemillasController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() async {
    final double pesoPulpa = await _databaseH.getNumericValue(practica,'peso_pulpa', idGrupo);
    final double pesoSemillas = await _databaseH.getNumericValue(practica, 'peso_semillas', idGrupo);

    setState(() {
      _pesoPulpaController.text = pesoPulpa == 0.0 ? "" : pesoPulpa.toString();
      _pesoSemillasController.text = pesoSemillas == 0.0 ? "" : pesoSemillas.toString();
    });
  }


  void _guardarPesoPulpa() async {
    final String pesoStr = _pesoPulpaController.text;
    final double? peso = double.tryParse(pesoStr);
    await _dbManager.insertSingleDataPractica(practica, 'peso_pulpa', peso, idGrupo, context);
  }

  void _guardarPesoSemilla() async {
    final String pesoStr = _pesoSemillasController.text;
    final double? peso = double.tryParse(pesoStr);
    await _dbManager.insertSingleDataPractica(practica, 'peso_semillas', peso, idGrupo,  context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proceso anterior', style: TextStyle(fontSize: 28.sp)),
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            onTap: (){Navigator.push(
                context, MaterialPageRoute(builder: (_) => MenuPulpaReal()));},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Volver al Menú', style: TextStyle(fontSize: 26.sp)),
                SizedBox(width: 4.w),
                Icon(Icons.menu_open, size: 46.sp),
              ],
            ),
          ),
          SizedBox(width: 20.w),
        ],),
      body: Stack(
        children: <Widget>[
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints:  BoxConstraints(maxWidth: 600.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                      color: Colors.green,
                      child:  Text(
                        'PESADO OFICIAL',
                        style: TextStyle(color: Colors.white, fontSize: 35.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child:  Text(
                        'Registro de la materia prima disponible para reformular',
                        style: TextStyle(color: Colors.white, fontSize: 25.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Ingrese el peso de la pulpa',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pesoPulpaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Peso',
                        hintText: 'Introduzca el peso en kilogramos',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                      ],
                    ),
                     SizedBox(height: 16.0.h),
                    // Nuevo texto de etiqueta para el segundo cuadro de texto
                     Text(
                      'Ingrese el peso las semillas',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    // Segundo cuadro de texto
              TextField(
                controller: _pesoSemillasController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso',
                  hintText: 'Introduzca el peso en kilogramos',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
              ),
               SizedBox(height: 18.0.h),
              ElevatedButton(
                onPressed: () {
                  _guardarPesoSemilla(); // Llama a la función _guardarPesoSemilla()
                  _guardarPesoPulpa(); // Llama a la función _guardarPesoPulpa()
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => RecepcionPage23()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                child: const Text('Aceptar'),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
