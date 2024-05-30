import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base/paginas/vista_profes/p_11_pulpa.dart';
import 'package:base/paginas/vista_profes/p_11_refresco.dart';
import 'package:base/paginas/vista_profes/p_12.dart';
import 'package:base/paginas/vista_profes/p_13.dart';
import 'package:base/base_datos.dart';  // Asegúrate de que la ruta es correcta
import 'package:base/funciones_proyecto/select_actividad_profe.dart';
import 'package:base/preferences.dart';  // Asegúrate de que la ruta es correcta

class PagInicio10 extends StatefulWidget {
  const PagInicio10({Key? key}) : super(key: key);

  @override
  State<PagInicio10> createState() => _PagInicio10State();
}

class _PagInicio10State extends State<PagInicio10> {
  String practica = UserPreferences.getPracticaSeleccionada();
  int idGrupo = UserPreferences.getIdGrupo();
  final DatabaseHelper _databaseH = DatabaseHelper.instance;

  bool isDataFilledFormulacion = false;
  bool isDataFilledDatosBase = false;
  bool isDataFilledTiempos = false;

  @override
  void initState() {
    super.initState();
    checkData();
  }

  void checkData() async {
    List<String> fieldsFormulacion = practica == 'practica1' ?
    ['p_pulpa', 'p_acido_ascorbico', 'p_acido_citrico', 'p_benzonato_sodio', 'p_sorbato_potasio'] :
    ['p_pulpa', 'p_azucar', 'p_agua', 'p_CMC', 'p_acido_ascorbico', 'p_benzonato_sodio', 'p_sorbato_potasio'];

    isDataFilledFormulacion = await _databaseH.areFieldsFilled(practica, idGrupo, fieldsFormulacion);
    isDataFilledDatosBase = await _databaseH.areFieldsFilled(practica, idGrupo, ['unidades_producir', 'unidades_empaque']);
    isDataFilledTiempos = await _databaseH.areFieldsFilled(practica, idGrupo, ['tiempo_escaldado', 'tiempo_enfriamiento']);
    setState(() {}); // Actualiza el UI con los nuevos datos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selecciona el tipo de información',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80.h),
              ElevatedButton(
                onPressed: () {
                  if (practica == 'practica1') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio11_pulpa()));
                  } else if (practica == 'practica2') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio11_refresco()));
                  }
                },
                child: Text(
                  'FORMULACIÓN',
                  style: TextStyle(color: Colors.white, fontSize: 40.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDataFilledFormulacion ? Colors.blue : Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(450.w, 50.h),
                ),
              ),
              SizedBox(height: 20.h),
              buttonSection('DATOS BASE', isDataFilledDatosBase, const PagInicio12()),
              SizedBox(height: 20.h),
              buttonSection('TIEMPOS', isDataFilledTiempos, const PagInicio13()),
              SizedBox(height: 60.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Select_p()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  fixedSize: Size(320.w, 50.h),
                ),
                child: const Text('Volver al menú'),
              ),
              SizedBox(height: 40.h),
              Container(
                height: 120.h,
                child: Image.asset(
                  'assets/UQ.png', // Asegúrate de que el logo está en tu carpeta de assets.
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonSection(String text, bool isFilled, Widget nextPage) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextPage));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 40.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isFilled ? Colors.blue : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(450.w, 50.h),
      ),
    );
  }
}