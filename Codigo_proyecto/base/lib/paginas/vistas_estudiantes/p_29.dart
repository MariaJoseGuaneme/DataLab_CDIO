import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';


class RecepcionPage29 extends StatefulWidget {
  const RecepcionPage29({super.key});

  @override
  _RecepcionPage29State createState() => _RecepcionPage29State();
}

class _RecepcionPage29State extends State<RecepcionPage29> {
  final TextEditingController _perdidasController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager

  @override
  void initState() {
    super.initState();
    _cargarPerdidas();
  }


  void _cargarPerdidas() async {
      final double perdidas = await _databaseH.getPerdidas_empacado();
      setState(() {
        _perdidasController.text = perdidas.toString();
      });
    }

  void _guardarPesoInicial() async {
    final String perdidasSr = _perdidasController.text;
    if (perdidasSr.isNotEmpty) {
      final double? perdidas = double.tryParse(perdidasSr);
      if (perdidas != null) {
        // Actualiza solo el campo de pesoInicial
        try {
          await _dbManager.insertSingleDataPractica1('perdidas_empacado', perdidas, context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Peso inicial guardado con éxito')),
          );
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
                              '3. PESADO',
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
                            'Ingrese el peso inicial',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 8.0),
                          TextField(
                            controller: _perdidasController,
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
                            onPressed: _guardarPesoInicial,
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