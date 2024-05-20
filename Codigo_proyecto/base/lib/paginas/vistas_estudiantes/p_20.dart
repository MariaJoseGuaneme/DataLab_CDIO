import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart'; // Importa tu DatabaseManager
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../preferences.dart';

class RecepcionPage20 extends StatefulWidget {
  const RecepcionPage20({super.key});

  @override
  _RecepcionPage20State createState() => _RecepcionPage20State();
}

class _RecepcionPage20State extends State<RecepcionPage20> {
  final TextEditingController _pesoCascaraController = TextEditingController();
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
      final double pesoCascara = await _databaseH.getNumericValue(practica,'peso_cascara', idGrupo);
      setState(() {
        _pesoCascaraController.text = pesoCascara== 0 ? "":pesoCascara.toString();
      });
    }


  void _guardarPesoCascara() async {
    final String pesoStr = _pesoCascaraController.text;
    final double? peso = double.tryParse(pesoStr);
    await _dbManager.insertSingleDataPractica(practica, 'peso_cascara', peso, idGrupo, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
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
                        '8. ACONDICIONAMIENTO',
                        style: TextStyle(color: Colors.white, fontSize: 35.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child:  Text(
                        'Proceso en el cual se le retira la cáscara a la materia prima',
                        style: TextStyle(color: Colors.white, fontSize: 25.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Ingrese el peso de la cáscara',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pesoCascaraController,
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
