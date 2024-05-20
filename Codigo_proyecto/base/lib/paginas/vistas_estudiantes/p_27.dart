import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../preferences.dart';


class RecepcionPage27 extends StatefulWidget {
  const RecepcionPage27({super.key});

  @override
  _RecepcionPage27State createState() => _RecepcionPage27State();
}

class _RecepcionPage27State extends State<RecepcionPage27> {
  final TextEditingController _perdidasollaController = TextEditingController();
  final TextEditingController _perdidasollaempacadaController = TextEditingController();
  final TextEditingController _pulpatotalController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    _cargarPerdidas();
  }


  void _cargarPerdidas() async {
      final double perdidas_olla = await _databaseH.getNumericValue(practica, 'perdidas_olla', idGrupo);
      final double perdidas_olla_envasado = await _databaseH.getNumericValue(practica, 'perdidas_olla_empacado', idGrupo);
      final double pulpaTotal = await _databaseH.getNumericValue(practica, 'peso_pulpa_empacada', idGrupo);
      setState(() {
        _perdidasollaController.text = perdidas_olla == 0.0 ? "" : perdidas_olla.toString();
        _perdidasollaempacadaController.text = perdidas_olla_envasado == 0.0 ? "" : perdidas_olla_envasado.toString();
        _pulpatotalController.text = pulpaTotal == 0.0 ? "" : pulpaTotal.toString();
      });
    }

  void _guardarPesoolla() async {
    final String pesoSr = _perdidasollaController.text;
    final double? peso = double.tryParse(pesoSr);
    await _dbManager.insertSingleDataPractica(practica, 'perdidas_olla', peso,idGrupo, context);
  }

  void _guardarPesoollaenvasado() async {
    final String pesoSr = _perdidasollaempacadaController.text;
    final double? peso = double.tryParse(pesoSr);
    await _dbManager.insertSingleDataPractica(practica, 'perdidas_olla_empacado', peso, idGrupo, context);
  }

  void _guardarPulpaTotal() async {
    final String perdidasSr = _pulpatotalController.text;
    final double? perdidas = double.tryParse(perdidasSr);
    await _dbManager.insertSingleDataPractica(practica, 'peso_pulpa_empacada', perdidas,idGrupo, context);
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
                constraints:  BoxConstraints(maxWidth: 600.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                          Container(
                            padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                            color: Colors.green,
                            child: Text(
                              '15. EMPACADO/ENVASADO',
                              style: TextStyle(color: Colors.white, fontSize: 35.sp),
                              textAlign: TextAlign.center,
                            ),
                          ),
                           SizedBox(height: 16.0.h),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.green.shade300,
                            child:  Text(
                              'Disposición del producto en un envase con el mismo gramaje',
                              style: TextStyle(color: Colors.white, fontSize: 25.sp),
                              textAlign: TextAlign.center,
                            ),
                          ),
                           SizedBox(height: 16.0.h),
                           Text(
                            'Ingrese el peso de la olla',
                            style: TextStyle(fontSize: 22.sp),
                            textAlign: TextAlign.left,
                          ),
                           SizedBox(height: 12.h),
                          TextField(
                            controller: _perdidasollaController,
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

                       Text(
                        'Ingrese el peso de la olla después del envasado',
                        style: TextStyle(fontSize: 22.sp),
                        textAlign: TextAlign.left,
                      ),
                       SizedBox(height: 12.h),
                      TextField(
                        controller: _perdidasollaempacadaController,
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

                       Text(
                        'Ingrese el peso de la pulpa total empacada',
                        style: TextStyle(fontSize: 22.sp),
                        textAlign: TextAlign.left,
                      ),
                       SizedBox(height: 12.h),
                      TextField(
                        controller: _pulpatotalController,
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
                            onPressed:(){
                            _guardarPesoolla();
                            _guardarPesoollaenvasado();
                            _guardarPulpaTotal();
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