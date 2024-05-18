import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos.dart';
import 'package:base/base_datos_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../preferences.dart';

class PagInicio11_refresco extends StatefulWidget {
  const PagInicio11_refresco({super.key});

  @override
  State<PagInicio11_refresco> createState() => _PagInicio11_refrescoState();
}

class _PagInicio11_refrescoState extends State<PagInicio11_refresco> {
  final TextEditingController _ppulpaController = TextEditingController();
  final TextEditingController _pazucarController = TextEditingController();
  final TextEditingController _paguaController = TextEditingController();
  final TextEditingController _pcmcController = TextEditingController();
  final TextEditingController _pacidoascorbicoController = TextEditingController();
  final TextEditingController _pbenzoatosodioController = TextEditingController();
  final TextEditingController _psorbatopotasioController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance;
  final DatabaseManager _dbManager = DatabaseManager();
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  void _cargarDatos() async {
    final double pPulpa = await _databaseH.getNumericValue(practica,'p_pulpa',idGrupo);
    final double pazucar = await _databaseH.getNumericValue(practica, 'p_azucar', idGrupo);
    final double pagua = await _databaseH.getNumericValue(practica, 'p_agua', idGrupo);
    final double pcmc = await _databaseH.getNumericValue(practica, 'p_CMC', idGrupo);
    final double pacidoascorbico = await _databaseH.getNumericValue(practica, 'p_acido_ascorbico', idGrupo);
    final double pbenzoatosodio = await _databaseH.getNumericValue(practica, 'p_benzonato_sodio', idGrupo);
    final double psorbatopotasio = await _databaseH.getNumericValue(practica, 'p_sorbato_potasio', idGrupo);
    setState(() {
      _ppulpaController.text = pPulpa == 0.0 ? "" : pPulpa.toString();
      _pazucarController.text = pazucar == 0.0 ? "" : pazucar.toString();
      _paguaController.text = pagua == 0.0 ? "" : pagua.toString();
      _pcmcController.text = pcmc == 0.0 ? "" : pcmc.toString();
      _pacidoascorbicoController.text = pacidoascorbico == 0.0 ? "" : pacidoascorbico.toString();
      _pbenzoatosodioController.text = pbenzoatosodio == 0.0 ? "" : pbenzoatosodio.toString();
      _psorbatopotasioController.text = psorbatopotasio == 0.0 ? "" : psorbatopotasio.toString();
    });
  }

  void _guardarDatos() async {
    // Guardar todos los valores de una sola vez
    await _dbManager.insertSingleDataPractica(practica, 'p_pulpa', double.tryParse(_ppulpaController.text), idGrupo, context);
    await _dbManager.insertSingleDataPractica(practica, 'p_azucar', double.tryParse(_pazucarController.text), idGrupo, context);
    await _dbManager.insertSingleDataPractica(practica, 'p_agua', double.tryParse(_paguaController.text), idGrupo, context);
    await _dbManager.insertSingleDataPractica(practica, 'p_CMC', double.tryParse(_pcmcController.text), idGrupo, context);
    await _dbManager.insertSingleDataPractica(practica, 'p_acido_ascorbico', double.tryParse(_pacidoascorbicoController.text), idGrupo, context);
    await _dbManager.insertSingleDataPractica(practica, 'p_benzonato_sodio', double.tryParse(_pbenzoatosodioController.text), idGrupo, context);
    await _dbManager.insertSingleDataPractica(practica, 'p_sorbato_potasio', double.tryParse(_psorbatopotasioController.text), idGrupo, context);
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
              width: 200.w.h,
              height: 200,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints:  BoxConstraints(maxWidth: 600.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                      color: Colors.green,
                      child:  Text(
                        'Ingrese los porcentajes',
                        style: TextStyle(color: Colors.white, fontSize: 24.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 16.0.h),
                    _crearTextField('Pulpa', _ppulpaController, 'Ingrese el porcentaje de pulpa'),
                    _crearTextField('Azúcar', _pazucarController, 'Ingrese el porcentaje de azúcar'),
                    _crearTextField('Agua', _paguaController, 'Ingrese el porcentaje de agua'),
                    _crearTextField('CMC', _pcmcController, 'Ingrese el porcentaje de CMC'),
                    _crearTextField('Ácido ascórbico', _pacidoascorbicoController, 'Ingrese el porcentaje de ácido ascórbico'),
                    _crearTextField('Benzoato de sodio', _pbenzoatosodioController, 'Ingrese el porcentaje de benzoato de sodio'),
                    _crearTextField('Sorbato de potasio', _psorbatopotasioController, 'Ingrese el porcentaje de sorbato de potasio'),
                     SizedBox(height: 16.0.h),
                    ElevatedButton(
                      onPressed: _guardarDatos,
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

  Widget _crearTextField(String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:  TextStyle(fontSize: 16.sp),
          textAlign: TextAlign.left,
        ),
         SizedBox(height: 8.0.h),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: hint,
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
        ),
         SizedBox(height: 16.0.h),
      ],
    );
  }
}
