import 'package:base/paginas/vista_profes/p_6.dart';
import 'package:base/paginas/vista_profes/p_9.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../paginas/vista_profes/p_4.dart';

class Select_p extends StatefulWidget {
  const Select_p({super.key});

  @override
  State<Select_p> createState() => _Select_p();
}

class _Select_p extends State<Select_p> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataLab+', style: TextStyle(fontSize: 32.sp)),
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            onTap: showHelpDialog,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ayuda', style: TextStyle(fontSize: 26.sp)),
                SizedBox(width: 4.w),
                Icon(Icons.help_outline, size: 46.sp),
              ],
            ),
          ),
          SizedBox(width: 20.w),
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
          content: Text('1. INSERTAR DATOS: Para ingresar los datos base necesarios en cada práctica\n 2. REVISAR DATOS: Para observar los datos de las prácticas hechas por el grupo'),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ],
        );
      },
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
         SizedBox(height: 5.0.h),
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
                  MaterialPageRoute(builder: (context) => const PagInicio9()),
                );
                // Handle INSERTAR DATOS tap
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
                    'INSERTAR DATOS',
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
                  MaterialPageRoute(builder: (context) => const PagInicio6()),
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
      ],
    ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PagInicio4()));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            fixedSize: Size(320.w, 50.h),
          ),
          child: const Text('Grupos'),
        ),
      ],
    ),
  );
}
