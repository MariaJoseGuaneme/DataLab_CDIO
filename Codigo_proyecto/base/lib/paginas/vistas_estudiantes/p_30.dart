import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart'; // Importa tu DatabaseManager
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../preferences.dart';

class RecepcionPage30 extends StatefulWidget {
  const RecepcionPage30({super.key});

  @override
  _RecepcionPage30State createState() => _RecepcionPage30State();
}

class _RecepcionPage30State extends State<RecepcionPage30> {
  final TextEditingController _pesoEbullicionController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    _cargarPesoEbullicion();
  }

  void _cargarPesoEbullicion() async {
      final double pesoEbullicion = await _databaseH.getNumericValue(practica,'peso_ebullicion', idGrupo);
      setState(() {
        _pesoEbullicionController.text = pesoEbullicion== 0 ? "":pesoEbullicion.toString();
      });
    }


  void _guardarPesoCascara() async {
    final String pesoStr = _pesoEbullicionController.text;
    final double? peso = double.tryParse(pesoStr);
    await _dbManager.insertSingleDataPractica(practica, 'peso_ebullicion', peso, idGrupo, context);
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
                constraints: BoxConstraints(maxWidth: 600.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                      color: Colors.green,
                      child:  Text(
                        '14. PESADO - EBULLICIÓN',
                        style: TextStyle(color: Colors.white, fontSize: 24.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16.0.h),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child: Text(
                        'Descripción del proceso de acondicionamiento. Aquí va el contenido descriptivo sobre cómo se maneja el acondicionamiento en tu proceso.',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Ingrese el peso después de ebullición',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pesoEbullicionController,
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
                      onPressed: _guardarPesoCascara,
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
