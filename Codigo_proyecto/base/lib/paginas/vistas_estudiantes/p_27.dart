import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';


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

  @override
  void initState() {
    super.initState();
    _cargarPerdidas();
  }


  void _cargarPerdidas() async {
      final double perdidas_olla = await _databaseH.getPerdidasolla();
      final double perdidas_olla_envasado = await _databaseH.getPerdidasollaenvasado();
      final double pulpaTotal = await _databaseH.getPulpaTotal();
      setState(() {
        _perdidasollaController.text = perdidas_olla == 0.0 ? "" : perdidas_olla.toString();
        _perdidasollaempacadaController.text = perdidas_olla_envasado == 0.0 ? "" : perdidas_olla_envasado.toString();
        _pulpatotalController.text = pulpaTotal == 0.0 ? "" : pulpaTotal.toString();
      });
    }

  void _guardarPesoolla() async {
    final String perdidasSr = _perdidasollaController.text;
    if (perdidasSr.isNotEmpty) {
      final double? perdidas = double.tryParse(perdidasSr);
      if (perdidas != null) {
        // Actualiza solo el campo de pesoInicial
        try {
          await _dbManager.insertSingleDataPractica1('perdidas_olla', perdidas, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el peso: ${e.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un número válido.')),
        );
      }
    }
  }

  void _guardarPesoollaenvasado() async {
    final String perdidasSr = _perdidasollaempacadaController.text;
    if (perdidasSr.isNotEmpty) {
      final double? perdidas = double.tryParse(perdidasSr);
      if (perdidas != null) {
        // Actualiza solo el campo de pesoInicial
        try {
          await _dbManager.insertSingleDataPractica1('perdidas_olla_empacado', perdidas, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el peso: ${e.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un número válido.')),
        );
      }
    }
  }

  void _guardarPulpaTotal() async {
    final String perdidasSr = _pulpatotalController.text;
    if (perdidasSr.isNotEmpty) {
      final double? perdidas = double.tryParse(perdidasSr);
      if (perdidas != null) {
        try {
          await _dbManager.insertSingleDataPractica1('peso_pulpa_empacada', perdidas, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el peso: ${e.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un número válido.')),
        );
      }
    }
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
                        'Ingrese el peso de la pulpa total empacada',
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 12),
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
                          const SizedBox(height: 18.0),
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