import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart'; // Importa tu DatabaseManager

class RecepcionPage20 extends StatefulWidget {
  const RecepcionPage20({super.key});

  @override
  _RecepcionPage20State createState() => _RecepcionPage20State();
}

class _RecepcionPage20State extends State<RecepcionPage20> {
  final TextEditingController _pesoCascaraController = TextEditingController();
  final DatabaseManager _dbManager = DatabaseManager();
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cargarPesoCascara();
  }

  void _cargarPesoCascara() async {
    try {
      final double pesoCascara = await _dbManager.getPesoCascara();
      setState(() {
        _pesoCascaraController.text = pesoCascara.toString();
        _isLoading = false;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Error al cargar el peso de la cáscara: ${e.toString()}';
      });
    }
  }

  void _guardarPesoCascara() async {
    final String pesoStr = _pesoCascaraController.text;
    if (pesoStr.isNotEmpty) {
      final double? peso = double.tryParse(pesoStr);
      if (peso != null) {
        try {
          await _dbManager.insertSingleDataPractica1('peso_cascara', peso, context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Peso de la cáscara guardado con éxito')),
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
                        '8. ACONDICIONAMIENTO',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.green.shade300,
                      child: const Text(
                        'Descripción del proceso de acondicionamiento. Aquí va el contenido descriptivo sobre cómo se maneja el acondicionamiento en tu proceso.',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Ingrese el peso de la cáscara',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _pesoCascaraController,
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
                      onPressed: _guardarPesoCascara,
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
