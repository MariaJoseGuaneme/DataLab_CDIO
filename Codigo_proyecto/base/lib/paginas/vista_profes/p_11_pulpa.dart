import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos.dart';
import 'package:base/base_datos_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/menu_pulpa.dart';
import '../../preferences.dart';
import 'p_10.dart';

class PagInicio11_pulpa extends StatefulWidget {
  const PagInicio11_pulpa({super.key});

  @override
  State<PagInicio11_pulpa> createState() => _PagInicio11_pulpaState();
}
//todos los p(pulpa, acido ascorbico, acido citrico, benzoato de sodio, sorbato de potasio)
class _PagInicio11_pulpaState extends State<PagInicio11_pulpa> {
  final TextEditingController _ppulpaController = TextEditingController();
  final TextEditingController _pacidoascorbicoController = TextEditingController();
  final TextEditingController _pacidocitricoController = TextEditingController();
  final TextEditingController _pbenzoatosodioController = TextEditingController();
  final TextEditingController _psorbatopotasioController = TextEditingController();
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
      final double pPulpa = await _databaseH.getNumericValue(practica,'p_pulpa',idGrupo);
      final double pacidoascorbico = await _databaseH.getNumericValue(practica, 'p_acido_ascorbico', idGrupo);
      final double pacidocitrico = await _databaseH.getNumericValue(practica, 'p_acido_citrico', idGrupo);
      final double pbenzoatosodio = await _databaseH.getNumericValue(practica, 'p_benzonato_sodio', idGrupo);
      final double psorbatopotasio = await _databaseH.getNumericValue(practica, 'p_sorbato_potasio', idGrupo);
      setState(() {
        _ppulpaController.text = pPulpa == 0.0 ? "" : pPulpa.toString();
        _pacidoascorbicoController.text = pacidoascorbico == 0.0 ? "" : pacidoascorbico.toString();
        _pacidocitricoController.text = pacidocitrico == 0.0 ? "" : pacidocitrico.toString();
        _pbenzoatosodioController.text = pbenzoatosodio == 0.0 ? "" : pbenzoatosodio.toString();
        _psorbatopotasioController.text = psorbatopotasio == 0.0 ? "" : psorbatopotasio.toString();
      });

  }



  Future<void> _guardarP_pulpa() async {
    final String ppulpaStr = _ppulpaController.text;
    final double? ppulpa = double.tryParse(ppulpaStr);
    await _dbManager.insertSingleDataPractica(practica, 'p_pulpa', ppulpa, idGrupo, context);
  }

  Future<void> _guardarP_ascorbico() async {
    final String pascorbicoStr = _pacidoascorbicoController.text;
    final double? pascorbico = double.tryParse(pascorbicoStr);
    await _dbManager.insertSingleDataPractica(practica, 'p_acido_ascorbico', pascorbico, idGrupo, context);
  }

  Future<void> _guardarP_citrico() async {
    final String pcitricoStr = _pacidocitricoController.text;
    final double? pcitrico = double.tryParse(pcitricoStr);
    await _dbManager.insertSingleDataPractica(practica, 'p_acido_citrico', pcitrico, idGrupo, context);
  }

  Future<void> _guardarP_benzonato() async {
    final String pbenzonatoStr = _pbenzoatosodioController.text;
    final double? pbenzonato = double.tryParse(pbenzonatoStr);
    await _dbManager.insertSingleDataPractica(practica, 'p_benzonato_sodio', pbenzonato,idGrupo, context);
  }

  Future<void> _guardarP_sorbato() async {
    final String psorbatoStr = _psorbatopotasioController.text;
    final double? psorbato = double.tryParse(psorbatoStr);
    await _dbManager.insertSingleDataPractica(practica,'p_sorbato_potasio', psorbato, idGrupo, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Proceso anterior', style: TextStyle(fontSize: 28.sp)),
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            onTap: (){Navigator.push(
                context, MaterialPageRoute(builder: (_) => MenuPulpaReal()));},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Volver al Menú', style: TextStyle(fontSize: 26.sp)),
                SizedBox(width: 4.w),
                Icon(Icons.menu_open, size: 46.sp),
              ],
            ),
          ),
          SizedBox(width: 20.w),
        ],),
      body: Stack(
        children: [
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
                     Text(
                      'Pulpa',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.sp),
                    TextField(
                      controller: _ppulpaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de pulpa',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Ácido ascórbico',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pacidoascorbicoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de ácido ascórbico',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                    SizedBox(height: 16.0.h),
                    Text(
                      'Ácido cítrico',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pacidocitricoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de ácido cítrico',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Benzoato de sodio',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _pbenzoatosodioController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de benzoato de sodio',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                     SizedBox(height: 16.0.h),
                     Text(
                      'Sorbato de potasio',
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 8.0.h),
                    TextField(
                      controller: _psorbatopotasioController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingrese el procentaje de sorbato de potasio',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                    ),
                     SizedBox(height: 16.0.h),
                    ElevatedButton(
                      onPressed: () async {
                        await _guardarP_ascorbico();
                        await _guardarP_benzonato();
                        await _guardarP_citrico();
                        await _guardarP_pulpa();
                        await _guardarP_sorbato();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio10()));
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
