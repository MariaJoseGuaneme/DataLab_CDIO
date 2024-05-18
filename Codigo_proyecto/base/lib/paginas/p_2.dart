import 'package:base/paginas/vista_profes/p_3a.dart';
import 'package:base/paginas/vistas_estudiantes/p_3.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
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
     backgroundColor: Colors.white,
     body: inicio(context),
);
}
}

Widget inicio(context){
return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height:400.h ,
              width: 400.w,
              child: Image.asset('assets/logou.jpg'), 
            ),
             SizedBox(height: 8.0.h,),
          Container(
            width: 350.w,
            height: 85.h,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green,width: 4.0),
              borderRadius: BorderRadius.circular(10.0)
            ),

            child:  Center(
            child: Text('Selecciona tu rol',
             style: TextStyle(color: Colors.white,fontSize: 30.sp,
              fontWeight: FontWeight.bold,backgroundColor:Colors.green),
            textAlign: TextAlign.center,)
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
              color: const Color.fromARGB(255, 89, 135, 213),
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
                  // Handle INSERTAR DATOS tap
                },
                child:
              Container(
                width: 300.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 85, 223, 138),
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
           )
        ],
      )
   );
}