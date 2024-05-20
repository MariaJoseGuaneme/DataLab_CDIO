import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PagInicio4 extends StatefulWidget {
  const PagInicio4({super.key});

  @override
  State<PagInicio4> createState() => _PagInicio4(); 
}

class _PagInicio4 extends State<PagInicio4> {
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
          height: 400.h,
          width: 400.w,
          child: Image.asset('assets/logou.jpg'),
        ),
         SizedBox(height: 10.0.h),
        Container(
          width: 300.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.green, width: 4.0),
            borderRadius: BorderRadius.circular(10.0),
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
         SizedBox(height: 20.0.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 200.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 135, 213),
                  border: Border.all(
                      color: const Color.fromARGB(255, 68, 100, 165), width: 10),
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
              },
              child: Container(
                width: 200.w,
                height: 100.h,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 85, 223, 138),
                  border: Border.all(
                      color: const Color.fromARGB(255, 104, 203, 102), width: 10),
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
      ],
    ),
  );
}