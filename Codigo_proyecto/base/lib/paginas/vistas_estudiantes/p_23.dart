import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart'; // Asegúrate de importar tu DatabaseManager
import 'package:base/base_datos.dart';

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
      appBar: AppBar(
        title: const Text('Control Fisicoquímico'),
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
                        '11. CONTROL FISICO-QUIMICO',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
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
                    const SizedBox(height: 16.0),
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
                    const SizedBox(height: 16.0),
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
      ),
           )
    );
  }
}
