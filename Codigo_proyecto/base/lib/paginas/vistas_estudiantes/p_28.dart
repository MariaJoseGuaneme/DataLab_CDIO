import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecepcionPage28 extends StatelessWidget {
  const RecepcionPage28({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            child: SingleChildScrollView(
              // Permite el desplazamiento cuando el contenido excede la pantalla
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
                        '13. EBULLICIÓN',
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
                        'Proceso por el cual el producto de lleva a temperaturas altas',
                        style: TextStyle(color: Colors.white, fontSize: 25.sp),
                        textAlign: TextAlign.center,
                      ),
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
