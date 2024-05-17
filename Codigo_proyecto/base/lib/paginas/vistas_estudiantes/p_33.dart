import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart'; // Importa tu DatabaseManager
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../preferences.dart';

class RecepcionPage33 extends StatefulWidget {
  const RecepcionPage33({super.key});

  @override
  _RecepcionPage33State createState() => _RecepcionPage33State();
}

class _RecepcionPage33State extends State<RecepcionPage33> {
  final TextEditingController _pesoHomogeneizadoController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    _cargarPesoCascara();
  }

  void _cargarPesoCascara() async {
      final double pesoHomo = await _databaseH.getNumericValue(practica,'peso_homogenizacion', idGrupo);
      setState(() {
        _pesoHomogeneizadoController.text = pesoHomo== 0 ? "":pesoHomo.toString();
      });
    }


  void _guardarPesoHomo() async {
    final String pesoStr = _pesoHomogeneizadoController.text;
    final double? peso = double.tryParse(pesoStr);
    await _dbManager.insertSingleDataPractica(practica, 'peso_homogenizacion', peso, idGrupo, context);
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
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      color: Colors.green,
                      child:  Text(
                        '17. PESADO - HOMOGENEIZADO',
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
                      'Ingrese el peso depués de homogeneización',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pesoHomogeneizadoController,
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
                      onPressed: _guardarPesoHomo,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('Aceptar'),
                    ),
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
