import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos.dart';
import 'package:base/base_datos_manager.dart';

class PagInicio11 extends StatefulWidget {
  const PagInicio11({super.key});

  @override
  State<PagInicio11> createState() => _PagInicio11State();
}
//todos los p(pulpa, acido ascorbico, acido citrico, benzoato de sodio, sorbato de potasio)
class _PagInicio11State extends State<PagInicio11> {
  final TextEditingController _ppulpaController = TextEditingController();
  final TextEditingController _pacidoascorbicoController = TextEditingController();
  final TextEditingController _pacidocitricoController = TextEditingController();
  final TextEditingController _pbenzoatosodioController = TextEditingController();
  final TextEditingController _psorbatopotasioController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager


  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() async {
      final double pPulpa = await _databaseH.getP_pulpa();
      final double pacidoascorbico = await _databaseH.getP_acido_ascorbico();
      final double pacidocitrico = await _databaseH.getP_acido_citrico();
      final double pbenzoatosodio = await _databaseH.getP_benzonato_sodio();
      final double psorbatopotasio = await _databaseH.getP_sorbato_potasio();
      setState(() {
        _ppulpaController.text = pPulpa == 0.0 ? "" : pPulpa.toString();
        _pacidoascorbicoController.text = pacidoascorbico == 0.0 ? "" : pacidoascorbico.toString();
        _pacidocitricoController.text = pacidocitrico == 0.0 ? "" : pacidocitrico.toString();
        _pbenzoatosodioController.text = pbenzoatosodio == 0.0 ? "" : pbenzoatosodio.toString();
        _psorbatopotasioController.text = psorbatopotasio == 0.0 ? "" : psorbatopotasio.toString();
      });

  }



  void _guardarP_pulpa() async {
    final String ppulpaStr = _ppulpaController.text;
    if (ppulpaStr.isNotEmpty) {
      final double? ppulpa = double.tryParse(ppulpaStr);
      if (ppulpa != null) {
        try {
          await _dbManager.insertSingleDataPractica1('p_pulpa', ppulpa, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el porcentaje: ${e.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un número válido.')),
        );
      }
    }
  }

  void _guardarP_ascorbico() async {
    final String pascorbicoStr = _pacidoascorbicoController.text;
    if (pascorbicoStr.isNotEmpty) {
      final double? pascorbico = double.tryParse(pascorbicoStr);
      if (pascorbico != null) {
        try {
          await _dbManager.insertSingleDataPractica1('p_acido_ascorbico', pascorbico, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el porcentaje: ${e.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un número válido.')),
        );
      }
    }
  }

  void _guardarP_citrico() async {
    final String pcitricoStr = _pacidocitricoController.text;
    if (pcitricoStr.isNotEmpty) {
      final double? pcitrico = double.tryParse(pcitricoStr);
      if (pcitrico != null) {
        try {
          await _dbManager.insertSingleDataPractica1('p_acido_citrico', pcitrico, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el porcentaje: ${e.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un número válido.')),
        );
      }
    }
  }

  void _guardarP_benzonato() async {
    final String pbenzonatoStr = _pbenzoatosodioController.text;
    if (pbenzonatoStr.isNotEmpty) {
      final double? pbenzonato = double.tryParse(pbenzonatoStr);
      if (pbenzonato != null) {
        try {
          await _dbManager.insertSingleDataPractica1('p_benzonato_sodio', pbenzonato, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el porcentaje: ${e.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, ingrese un número válido.')),
        );
      }
    }
  }

  void _guardarP_sorbato() async {
    final String psorbatoStr = _psorbatopotasioController.text;
    if (psorbatoStr.isNotEmpty) {
      final double? psorbato = double.tryParse(psorbatoStr);
      if (psorbato != null) {
        try {
          await _dbManager.insertSingleDataPractica1('p_sorbato_potasio', psorbato, context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al guardar el porcentaje: ${e.toString()}')),
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
                        'Ingrese los porcentajes',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Pulpa',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _ppulpaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de pulpa',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Ácido ascórbico',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _pacidoascorbicoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de ácido ascórbico',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Ácido cítrico',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _pacidocitricoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de ácido cítrico',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Benzoato de sodio',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _pbenzoatosodioController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de benzoato de sodio',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Sorbato de potasio',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      controller: _psorbatopotasioController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de sorbato de potasio',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _guardarP_ascorbico();
                        _guardarP_benzonato();
                        _guardarP_citrico();
                        _guardarP_pulpa();
                        _guardarP_sorbato();
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
