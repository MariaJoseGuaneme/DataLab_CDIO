import 'package:base/paginas/vista_profes/p_11_pulpa.dart';
import 'package:base/paginas/vista_profes/p_11_refresco.dart';
import 'package:base/paginas/vista_profes/p_12.dart';
import 'package:base/paginas/vista_profes/p_13.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/select_actividad_profe.dart';
import '../../preferences.dart';

class PagInicio10 extends StatefulWidget {
  const PagInicio10({Key? key}) : super(key: key);

  @override
  State<PagInicio10> createState() => _PagInicio10State();
}

class _PagInicio10State extends State<PagInicio10> {
  String practica = UserPreferences.getPracticaSeleccionada();
  int idGrupo = UserPreferences.getIdGrupo();

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
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(450.w, 50.h),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio12()));
                },
                child: Text(
                  'DATOS BASE',
                  style: TextStyle(color: Colors.white, fontSize: 40.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(380.w, 50.h),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio13()));
                },
                child: Text(
                  'TIEMPOS',
                  style: TextStyle(color: Colors.white, fontSize: 40.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 20, 224, 211),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(350.w, 50.h),
                ),
              ),
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
                child: const Text('Volver al inicio'),
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
}
