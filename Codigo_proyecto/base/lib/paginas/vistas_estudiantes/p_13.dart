
import 'package:base/paginas/vistas_estudiantes/p_14.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/menu_pulpa.dart';
import '../../preferences.dart';


class RecepcionPage13 extends StatefulWidget {
  const RecepcionPage13({super.key});

  @override
  _RecepcionPage13State createState() => _RecepcionPage13State();
}

class _RecepcionPage13State extends State<RecepcionPage13> {
  final TextEditingController _pesoController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    _cargarPesoInicial();
  }


 void _cargarPesoInicial() async {
      final double pesoInicial = await _databaseH.getNumericValue(practica,'peso_inicial', idGrupo);
      setState(() {
        _pesoController.text = pesoInicial == 0 ? "" :pesoInicial.toString();
      });
    }


 void _guardarPesoInicial() async {
  final String pesoStr = _pesoController.text;
  final double? peso = double.tryParse(pesoStr);
  await _dbManager.insertSingleDataPractica(practica, 'peso_inicial', peso, idGrupo, context);
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
                        'PESADO INICIAL',
                        style: TextStyle(color: Colors.white, fontSize: 35.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child:  Text(
                        'Se pesa la materia prima inicial para conocer cuánta de esta, hay disponible para el producto',
                        style: TextStyle(color: Colors.white, fontSize: 25.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Ingrese el peso inicial',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pesoController,
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
                        _guardarPesoInicial();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => RecepcionPage14()));
                      },
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
