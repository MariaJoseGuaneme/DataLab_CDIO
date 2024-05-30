import 'package:base/paginas/vistas_estudiantes/p_27.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/menu_pulpa.dart';
import '../../preferences.dart';// Asegúrate de importar tu DatabaseManager

class RecepcionPage26 extends StatefulWidget {
  const RecepcionPage26({super.key});

  @override
  _RecepcionPage26State createState() => _RecepcionPage26State();
}

class _RecepcionPage26State extends State<RecepcionPage26> {
  final TextEditingController _brix2Controller = TextEditingController();
  final TextEditingController _ph2Controller = TextEditingController();
  final TextEditingController _acidez2Controller = TextEditingController();
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
    final double brix2 = await _databaseH.getNumericValue(practica, 'brix_2', idGrupo);
    final double ph2 = await _databaseH.getNumericValue(practica, 'ph_2', idGrupo);
    final double acidez2 = await _databaseH.getNumericValue(practica,'acidez_2', idGrupo);

    setState(() {
      _brix2Controller.text = brix2 == 0.0 ? "" : brix2.toString();
      _ph2Controller.text = ph2 == 0.0 ? "" : ph2.toString();
      _acidez2Controller.text = acidez2 == 0.0 ? "" : acidez2.toString();
    });
  }

  void _guardarDatos() async {
    final double? brixValue2 = double.tryParse(_brix2Controller.text);
    final double? phValue2 = double.tryParse(_ph2Controller.text);
    final double? acidezValue2 = double.tryParse(_acidez2Controller.text);

      await _dbManager.insertSingleDataPractica(practica, 'brix_2', brixValue2, idGrupo, context);

      await _dbManager.insertSingleDataPractica(practica, 'ph_2', phValue2, idGrupo, context );

      await _dbManager.insertSingleDataPractica(practica, 'acidez_2', acidezValue2, idGrupo, context);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Proceso anterior', style: TextStyle(fontSize: 28.sp)),
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
        ],
      ),
      body:
          Center(child:
          Stack(
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
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      color: Colors.green,
                      child:  Text(
                        'CONTROL FISICO-QUIMICO 2',
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 16.0.h),
                    // Agregar los demás elementos del formulario aquí
                    TextField(
                      controller: _brix2Controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Brix',
                        hintText: 'Introduzca los °Brix',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                    ),
                     SizedBox(height: 16.0.h),
                    TextField(
                      controller: _ph2Controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'pH',
                        hintText: 'Introduzca el pH',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                    ),
                     SizedBox(height: 16.0.h),
                    TextField(
                      controller: _acidez2Controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Acidez',
                        hintText: 'Introduzca la acidez',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d*')),
                      ],
                    ),
                     SizedBox(height: 18.0.h),
                    ElevatedButton(
                      onPressed: () {
                        _guardarDatos();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => RecepcionPage27()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('Guardar Datos'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),)
    );
  }
}

