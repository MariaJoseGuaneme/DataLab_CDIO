import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';

class PagInicio13 extends StatefulWidget {
  const PagInicio13({super.key});

  @override
  State<PagInicio13> createState() => _PagInicio13State();
}
//Tiempo de escaldado y enfriamiento
class _PagInicio13State extends State<PagInicio13> {
  final TextEditingController _tiempoEscaldadoController = TextEditingController();
  final TextEditingController _tiempoEnfriamientoController = TextEditingController();
  final TextEditingController _frutaController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  late final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  int idGrupo = 1;
  String practica = 'practica1';

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() async {
     {
      final double tiempoEscaldado = await _databaseH.getNumericValue(practica, 'tiempo_escaldado', idGrupo);
      final double tiempoEnfriamiento = await _databaseH.getNumericValue(practica, 'tiempo_enfriamiento', idGrupo);
       setState(() {
        _tiempoEscaldadoController.text = tiempoEscaldado == 0 ? "" :tiempoEscaldado.toString();
        _tiempoEnfriamientoController.text = tiempoEnfriamiento == 0 ? "" :tiempoEnfriamiento.toString();
      });
    }
  }


  void _guardarTiempoEscaldado() async {
    final String tiempoEscaldadoStr = _tiempoEscaldadoController.text;
    final double? tiempoEscaldado = double.tryParse(tiempoEscaldadoStr);
    await _dbManager.insertSingleDataPractica1('tiempo_escaldado', tiempoEscaldado, idGrupo, context);
  }


  void _guardarTiempoEnfriamiento() async {
    final String tenfriamientoStr = _tiempoEnfriamientoController.text;
    final double? tEnfriamiento = double.tryParse(tenfriamientoStr);
    await _dbManager.insertSingleDataPractica1('tiempo_enfriamiento', tEnfriamiento, idGrupo, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
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
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      color: Colors.green,
                      child: const Text(
                        'Ingrese los tiempos',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Tiempo de escaldado',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _tiempoEscaldadoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el tiempo de escaldado en minutos',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Tiempo de enfriamiento ',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _tiempoEnfriamientoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el tiempo de enfriamiento en minutos',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _guardarTiempoEscaldado();
                        _guardarTiempoEnfriamiento();
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