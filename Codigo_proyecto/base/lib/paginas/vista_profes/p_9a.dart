import 'package:flutter/material.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:base/paginas/vista_profes/p_10.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../preferences.dart';

class PagInicio9a extends StatefulWidget {
  const PagInicio9a({super.key});

  @override
  _PagInicio9aState createState() => _PagInicio9aState();
}

class _PagInicio9aState extends State<PagInicio9a> {
  final TextEditingController _frutaController = TextEditingController();
  final TextEditingController _brixController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  String practica = UserPreferences.getPracticaSeleccionada();
  int idGrupo = UserPreferences.getIdGrupo();

  @override
  void initState() {
    super.initState();
    _cargarPesoInicial();
  }


  void _cargarPesoInicial() async {
    final String fruta = await _databaseH.getTextValue(practica,'fruta', idGrupo);
    final double brix = await _databaseH.getNumericValue(practica, 'brix_fruta', idGrupo );
    setState(() {
      _frutaController.text = fruta == 'Na'? "":fruta.toString();
      _brixController.text = brix == 0? "" :brix.toString();

    });
  }

  void _guardarFruta() async {
    final String fruta = _frutaController.text;
    await _dbManager.insertSingleDataPractica(practica, 'fruta', fruta, idGrupo, context);
      }
  void _guardarBrix() async {
    final String brixSr = _brixController.text;
    final double? brix = double.tryParse(brixSr);
    await _dbManager.insertSingleDataPractica( practica, 'brix_fruta', brix, idGrupo, context);
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
              width: 200.w,
              height: 200.h,
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
                  children: <Widget>[
                    Container(
                      padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                      color: Colors.green,
                      child:  Text(
                        'Ingresar fruta',
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                     SizedBox(height: 50.h),
                     Text(
                      'Ingrese el nombre de la fruta',
                      style: TextStyle(fontSize: 22.sp),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _frutaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fruta',
                        hintText: 'Introduzca el nombre de la fruta',
                      ),
                    ),
                     Text(
                      'Ingrese los grados Brix de la fruta',
                      style: TextStyle(fontSize: 22.sp),
                      textAlign: TextAlign.left,
                    ),
                     SizedBox(height: 20.h),
                    TextField(
                      controller: _brixController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Brix',
                        hintText: 'Grados Brix de la fruta',
                      ),
                    ),
                     SizedBox(height: 18.0.h),
                    ElevatedButton(
                      onPressed: (){
                        _guardarFruta();
                        _guardarBrix();
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context) => const PagInicio10() ));
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
