import 'package:base/paginas/vistas_estudiantes/p_5.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../paginas/vista_profes/p_6.dart';



class Select_e extends StatefulWidget {
  const Select_e({super.key});

  @override
  State<Select_e> createState() => _Select_e();
}

class _Select_e extends State<Select_e> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Goes back to the previous page.
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: inicio(context),
    );
  }
}

Widget inicio(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 300.h,
          width: 300.w,
          child: Image.asset('assets/logou.jpg'),
        ),
         SizedBox(height: 2.h),
        Container(
          width: 300.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.green, width: 4.0),
                     ),
          child:  Center(
            child: Text(
              'Selecciona la actividad',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
         SizedBox(height: 40.0.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PagInicio6()),
                );
              },
              child: Container(
                width: 300.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 135, 213),
                  border: Border.all(
                      color: const Color.fromARGB(255, 68, 100, 165),
                      width: 4),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  Center(
                  child: Text(
                    'REVISAR PRACTICAS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
             SizedBox(width: 60.w),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PagInicio5()),
                );
              },
              child: Container(
                width: 300.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 85, 223, 138),
                  border: Border.all(
                      color: const Color.fromARGB(255, 104, 203, 102),
                      width: 4),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child:  Center(
                  child: Text(
                    'INICIAR PRACTICA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 80),
      ],
    ),
  );
}

