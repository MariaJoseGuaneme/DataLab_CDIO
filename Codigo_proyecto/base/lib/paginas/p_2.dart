import 'package:base/paginas/vista_profes/p_3a.dart';
import 'package:base/paginas/vistas_estudiantes/p_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PagInicio2 extends StatefulWidget {
  const PagInicio2({super.key});

  @override
  State<PagInicio2> createState() => _PagInicio2();
}

class _PagInicio2 extends State<PagInicio2> {
  @override
  Widget build(BuildContext context) { //appBar
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio' , style: TextStyle(fontSize: 30.sp)),
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            onTap: showHelpDialog,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ayuda', style: TextStyle(fontSize: 26.sp)), // Tamaño del texto
                SizedBox(width: 4.w),
                Icon(Icons.help_outline, size: 40.sp), // Tamaño del ícono
              ],
            ),
          ),
          SizedBox(width: 20.w), // Espaciado después del texto "Ayuda"
        ],
      ),
      backgroundColor: Colors.white,
      body: inicio(context),
    );
  }
  void showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ayuda:'),
          content: Text('Si eres profesor, selecciona el botón de "PROFESOR". Si eres estudiante, selecciona el botón de "ESTUDIANTE"'),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(), // Cierra el AlertDialog
              child: Text('OK'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green, side: BorderSide(color: Colors.green, width: 2), // Color y ancho del borde
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget inicio(context){
  return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height:250.h ,
              width: 250.w,
              child: Image.asset('assets/logou.jpg'),
            ),
            SizedBox(height: 40.h,),
            Container(
              width: 400.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green, width: 4.0),
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(
                child: Text(
                  'Selecciona tu rol',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),


            SizedBox(height: 50.0.h,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const PagInicio3a()),
                    );
                    // Handle INSERTAR DATOS tap
                  },
                  child: Container(
                    width: 300.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color.fromARGB(255, 89, 135, 213), Color.fromARGB(255, 68, 100, 165)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(4, 4),
                            blurRadius: 5,
                          ),
                        ],
                        border: Border.all(color: const Color.fromARGB(255, 68, 100, 165),width: 4),
                        borderRadius: BorderRadius.circular(10.0)
                    ),

                    child:  Center(
                        child: Text('PROFESOR',
                          style: TextStyle(color: Colors.white,fontSize: 30.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,)
                    ),
                  ),
                ),
                SizedBox(width: 60.w,),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const PagInicio3e()),
                      );
                    },
                    child:
                    Container(
                      width: 300.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(255, 85, 223, 138), Color.fromARGB(255, 104, 203, 102)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4, 4),
                              blurRadius: 5,
                            ),
                          ],
                          border: Border.all(color: const Color.fromARGB(255, 104, 203, 102),width: 4),
                          borderRadius: BorderRadius.circular(10.0)
                      ),

                      child:  Center(
                          child: Text('ESTUDIANTE',
                            style: TextStyle(color: Colors.white,fontSize: 30.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,)
                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 50.0.h,),
          ],
          )
      );
}