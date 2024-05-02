import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';

class PagInicio12 extends StatefulWidget {
  const PagInicio12({super.key});

  @override
  State<PagInicio12> createState() => _PagInicio12State();
}
//Unidades a producir y Unidades de empaque
class _PagInicio12State extends State<PagInicio12> {
  final TextEditingController _unidadesProducirController = TextEditingController();
  final TextEditingController _unidadesEmpaqueController = TextEditingController();
  final DatabaseManager _dbManager = DatabaseManager();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  int idGrupo = 1;
  String practica = 'practica1';

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() async {
      final double uproducir = await _databaseH.getNumericValue(practica, 'unidades_producir', idGrupo);
      final double uempaque = await _databaseH.getNumericValue(practica, 'unidades_empaque', idGrupo);
      setState(() {
        _unidadesProducirController.text = uproducir == 0 ? "" :uproducir.toString();
        _unidadesEmpaqueController.text = uempaque == 0 ? "" :uempaque.toString();
      });
    }

  void _guardarUnidadesProducir() async {
    final String uproducirStr = _unidadesProducirController.text;
    final double? uproducir = double.tryParse(uproducirStr);
    await _dbManager.insertSingleDataPractica1('unidades_producir', uproducir, idGrupo, context);
  }

  void _guardarUnidadesEmpaque() async {
    final String uempaqueStr = _unidadesEmpaqueController.text;
    final double? uempaque = double.tryParse(uempaqueStr);
    await _dbManager.insertSingleDataPractica1('unidades_empaque', uempaque, idGrupo, context);
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
                        'Ingresa las unidades a producir',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Unidades a producir',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _unidadesProducirController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese las unidades a producir',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Unidades de empaque',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _unidadesEmpaqueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese las unidades de empaque en gr',
                        hintText: 'Debe ser en gr'
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                       _guardarUnidadesProducir();
                       _guardarUnidadesEmpaque();
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