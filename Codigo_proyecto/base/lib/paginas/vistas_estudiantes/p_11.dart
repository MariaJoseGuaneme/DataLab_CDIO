import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../funciones_proyecto/menu_pulpa.dart';
import 'p_12.dart';

class RecepcionPage extends StatelessWidget {
  const RecepcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proceso anterior', style: TextStyle(fontSize: 28.sp)),
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
        ],
      ),
      body: Stack(
        children: <Widget>[
          // Imagen en la esquina superior izquierda
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/UQ.png',
              width: 200.w, // Puedes ajustar el tamaño según necesites
              height: 200.h,
            ),
          ),
          // Contenido centrado en la página
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              constraints:  BoxConstraints(
                  maxWidth: 600.w), // Limita el ancho máximo del contenido
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Recuadro de la recepción
                  Container(
                    padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                    color: Colors.green,
                    child:  Text(
                      'RECEPCIÓN',
                      style: TextStyle(color: Colors.white, fontSize: 35.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                   SizedBox(height: 16.0.h),
                  // Espacio para la descripción
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.green
                        .shade300, // Un tono de verde más claro para la descripción
                    child:  Text(
                      'Recepción de la materia prima que se utilizará en la práctica',
                      style: TextStyle(color: Colors.white, fontSize: 25.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200.w, // Esto forzará al botón a expandirse al máximo ancho permitido por el contenedor
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => RecepcionPage2()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                          // Añadir padding vertical si es necesario para aumentar la altura del botón
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
                        ),
                        child: Text('Continuar', style: TextStyle(color: Colors.white, fontSize: 30.sp)),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}