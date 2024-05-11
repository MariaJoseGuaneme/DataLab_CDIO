import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';

import '../../preferences.dart';// Asegúrate de importar tu DatabaseManager

class RecepcionPage29 extends StatefulWidget {
  const RecepcionPage29({super.key});

  @override
  _RecepcionPage29State createState() => _RecepcionPage29State();
}

class _RecepcionPage29State extends State<RecepcionPage29> {
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
        title: const Text('Control Fisicoquímico 2'),
      ),
      body:
          Center(child:
          Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/UQ.png',
              width: 200,
              height: 200,
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
                      child: const Text(
                        '13. CONTROL FISICO-QUIMICO',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
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
                    const SizedBox(height: 16.0),
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
                    const SizedBox(height: 16.0),
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
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: _guardarDatos,
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

