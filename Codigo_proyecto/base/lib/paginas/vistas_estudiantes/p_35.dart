import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';

import '../../preferences.dart';


class RecepcionPage35 extends StatefulWidget {
  const RecepcionPage35({super.key});

  @override
  _RecepcionPage35State createState() => _RecepcionPage35State();
}

class _RecepcionPage35State extends State<RecepcionPage35> {
  final TextEditingController _perdidasollaController = TextEditingController();
  final TextEditingController _perdidasollaempacadaController = TextEditingController();
  final TextEditingController _refrescoTotalController = TextEditingController();
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
    final double refrescoTotal = await _databaseH.getNumericValue(practica, 'peso_pulpa_empacada', idGrupo);
    setState(() {
      _perdidasollaController.text = perdidas_olla == 0.0 ? "" : perdidas_olla.toString();
      _perdidasollaempacadaController.text = perdidas_olla_envasado == 0.0 ? "" : perdidas_olla_envasado.toString();
      _refrescoTotalController.text = refrescoTotal == 0.0 ? "" : refrescoTotal.toString();
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

  void _guardarRefrescoTotal() async {
    final String refrescoSR = _refrescoTotalController.text;
    final double? refresco = double.tryParse(refrescoSR);
    await _dbManager.insertSingleDataPractica(practica, 'peso_refresco_empacado', refresco,idGrupo, context);
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
                        '15. EMPACADO/ENVASADO',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child: const Text(
                        'Descripción del proceso de pesado. Aquí va el contenido descriptivo sobre cómo se maneja el pesado en tu proceso.',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Ingrese el peso de la olla',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 12),
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

                    const Text(
                      'Ingrese el peso de la olla después del envasado',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 12),
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

                    const Text(
                      'Ingrese el peso del refresco total empacado',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _refrescoTotalController,
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
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed:(){
                        _guardarPesoolla();
                        _guardarPesoollaenvasado();
                        _guardarRefrescoTotal();
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