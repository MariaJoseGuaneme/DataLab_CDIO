import 'package:flutter/material.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/UQ.png',
              width: 200.w,
              height: 200.h,
            ),
          ),
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
                        '10. PESADO P/S',
                        style: TextStyle(color: Colors.white, fontSize: 24.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child:  Text(
                        'Descripción del proceso de acondicionamiento. Aquí va el contenido descriptivo sobre cómo se maneja el acondicionamiento en tu proceso.',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
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
