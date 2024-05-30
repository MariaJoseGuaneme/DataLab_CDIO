import 'package:base/paginas/vistas_estudiantes/p_18.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/menu_pulpa.dart';
import '../../preferences.dart';// Asegúrate de importar el DatabaseManager

class RecepcionPage16 extends StatefulWidget {
  const RecepcionPage16({super.key});

  @override
  _RecepcionPage16State createState() => _RecepcionPage16State();
}

class _RecepcionPage16State extends State<RecepcionPage16> {
  final TextEditingController _pesoEscaldadoController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    _cargarPesoEscaldado();
  }

  void _cargarPesoEscaldado() async {

      final double pesoEscaldado = await _databaseH.getNumericValue(practica, 'peso_escaldado', idGrupo);
      setState(() {
        _pesoEscaldadoController.text = pesoEscaldado == 0.0 ? "" : pesoEscaldado.toString();
      });
    }


  void _guardarPesoEscaldado() async {
    final String pesoStr = _pesoEscaldadoController.text;
    final double? peso = double.tryParse(pesoStr);
    await _dbManager.insertSingleDataPractica(practica, 'peso_escaldado', peso, idGrupo, context);
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
                constraints: BoxConstraints(maxWidth: 600.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                      color: Colors.green,
                      child:  Text(
                        'ESCALDADO',
                        style: TextStyle(color: Colors.white, fontSize: 35.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child:  Text(
                        'Cocción en agua a temperatura de ebullición de la materia prima durante un breve periodo de tiempo, con un posterior choque térmico, para mejorar las características del producto final',
                        style: TextStyle(color: Colors.white, fontSize: 22.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Ingrese el peso escaldado',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pesoEscaldadoController,
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
                        _guardarPesoEscaldado();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => RecepcionPage18()));
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
