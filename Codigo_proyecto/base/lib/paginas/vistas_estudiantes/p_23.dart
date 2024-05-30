import 'package:base/paginas/vistas_estudiantes/p_24_pulpa.dart';
import 'package:base/paginas/vistas_estudiantes/p_24_refresco.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart'; // Asegúrate de importar tu DatabaseManager
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/menu_pulpa.dart';
import '../../preferences.dart';

class RecepcionPage23 extends StatefulWidget {
  const RecepcionPage23({super.key});

  @override
  _RecepcionPage23State createState() => _RecepcionPage23State();
}

class _RecepcionPage23State extends State<RecepcionPage23> {
  final TextEditingController _brixController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _acidezController = TextEditingController();
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
    final double ph1 = await _databaseH.getNumericValue(practica,'ph_1', idGrupo);
    final double brix1 = await _databaseH.getNumericValue(practica, 'brix_1', idGrupo);
    final double acidez1 = await _databaseH.getNumericValue(practica,'acidez_1' , idGrupo); //Esta es ml de NaOH utilizados

    setState(() {
      _brixController.text = brix1 == 0.0 ? "" : brix1.toString();
      _phController.text = ph1 == 0.0 ? "" : ph1.toString();
      _acidezController.text = acidez1 == 0.0 ? "" : acidez1.toString();
    });
  }


  void _guardarDatos() async {
    final double? brixValue = double.tryParse(_brixController.text);
    final double? phValue = double.tryParse(_phController.text);
    final double? acidezValue = double.tryParse(_acidezController.text);

    await _dbManager.insertSingleDataPractica(practica, 'brix_1', brixValue, idGrupo, context);

    await _dbManager.insertSingleDataPractica(practica, 'ph_1', phValue, idGrupo, context);

    await _dbManager.insertSingleDataPractica(practica, 'acidez_1', acidezValue, idGrupo, context);
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
                      padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                      color: Colors.green,
                      child:  Text(
                        'CONTROL FISICO-QUIMICO 1',
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                    // Agregar los demás elementos del formulario aquí
                    TextField(
                      controller: _brixController,
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
                      controller: _phController,
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
                      controller: _acidezController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Acidez',
                        hintText: 'Introduzca los ml de NaOH utilizados',
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
                        if (practica == 'practica1'){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => RecepcionPage24_pulpa()));
                        }else {
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (_) => RecepcionPage24_refresco()));
                        };
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
      ),
           )
    );
  }
}
