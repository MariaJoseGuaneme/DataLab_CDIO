import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart'; // Asegúrate de importar tu DatabaseManager

class RecepcionPage26 extends StatefulWidget {
  const RecepcionPage26({super.key});

  @override
  _RecepcionPage26State createState() => _RecepcionPage26State();
}

class _RecepcionPage26State extends State<RecepcionPage26> {
  final TextEditingController _brix2Controller = TextEditingController();
  final TextEditingController _ph2Controller = TextEditingController();
  final TextEditingController _acidez2Controller = TextEditingController();
  final DatabaseManager _dbManager = DatabaseManager();
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() async {
    try {
      final brix2 = await _dbManager.getBrix2();
      final ph2 = await _dbManager.getPh2();
      final acidez2 = await _dbManager.getAcidez2();
      setState(() {
        _brix2Controller.text = brix2.toString();
        _ph2Controller.text = ph2.toString();
        _acidez2Controller.text = acidez2.toString();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = 'Error al cargar los datos: ${e.toString()}';
      });
    }
  }

  void _guardarDatos() async {
    // Convertir los valores de los controladores a números
    final double? brixValue2 = double.tryParse(_brix2Controller.text);
    final double? phValue2 = double.tryParse(_ph2Controller.text);
    final double? acidezValue2 = double.tryParse(_acidez2Controller.text);

    // Comprobar si alguno de los valores es nulo, lo que significa que la conversión falló
    if (brixValue2 == null || phValue2 == null || acidezValue2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingrese valores numéricos válidos.')),
      );
      return;
    }

    // Guardar Brix
    try {
      await _dbManager.insertSingleDataPractica1('brix_2', brixValue2, context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Valor de Brix guardado con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar Brix: ${e.toString()}')),
      );
    }

    // Guardar pH
    try {
      await _dbManager.insertSingleDataPractica1('ph_2', phValue2, context );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Valor de pH guardado con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar pH: ${e.toString()}')),
      );
    }

    // Guardar Acidez
    try {
      await _dbManager.insertSingleDataPractica1('acidez_2', acidezValue2, context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Valor de Acidez guardado con éxito')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar Acidez: ${e.toString()}')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Fisicoquímico'),
      ),
      body: _error != null
          ? Center(child: Text(_error!))
          : Stack(
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
      ),
    );
  }
}

