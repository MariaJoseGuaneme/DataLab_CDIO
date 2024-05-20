import 'package:base/paginas/vista_profes/p_11_pulpa.dart';
import 'package:base/paginas/vista_profes/p_11_refresco.dart';
import 'package:base/paginas/vista_profes/p_12.dart';
import 'package:base/paginas/vista_profes/p_13.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              Container(
                padding: const EdgeInsets.all(12),
                color: Colors.green,
                child: Text(
                  'Selecciona el tipo de información',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.sp, // Ajustado para ser más práctico en diferentes tamaños de pantalla
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50.h),
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
                  style: TextStyle(color: Colors.black, fontSize: 26.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  fixedSize: Size(300.w, 60.h), // Ajuste de tamaño para mantener la proporción
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Bordes redondeados sutiles
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio12()));
                },
                child: Text(
                  'DATOS BASE',
                  style: TextStyle(color: Colors.black, fontSize: 26.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(300.w, 60.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio13()));
                },
                child: Text(
                  'TIEMPOS',
                  style: TextStyle(color: Colors.black, fontSize: 26.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 20, 224, 211),
                  fixedSize: Size(300.w, 60.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
