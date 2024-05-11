import 'package:base/paginas/vista_profes/p_3a.dart';
import 'package:base/paginas/vistas_estudiantes/p_3.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';

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
              height:400 ,
              width: 400,
              child: Image.asset('assets/logou.jpg'), 
            ),
            const SizedBox(height: 30.0,),
          Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green,width: 4.0),
              borderRadius: BorderRadius.circular(10.0)
            ),

            child: const Center(
            child: Text('Selecciona tu rol',
             style: TextStyle(color: Colors.white,fontSize: 30,
              fontWeight: FontWeight.bold,backgroundColor:Colors.green),
            textAlign: TextAlign.center,)
            ),
            ),

            const SizedBox(height: 50.0,),
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
                width: 225,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 89, 135, 213),
              border: Border.all(color: const Color.fromARGB(255, 68, 100, 165),width: 10),
              borderRadius: BorderRadius.circular(10.0)
            ),

            child: const Center(
            child: Text('PROFESOR',
             style: TextStyle(color: Colors.white,fontSize: 30,
              fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,)
            ),
              ),
              ),
              const SizedBox(width: 60,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PagInicio3e()),
                  );
                  // Handle INSERTAR DATOS tap
                },
                child:
              Container(
                width: 225,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 85, 223, 138),
              border: Border.all(color: const Color.fromARGB(255, 104, 203, 102),width: 10),
              borderRadius: BorderRadius.circular(10.0)
            ),

            child: const Center(
            child: Text('ESTUDIANTE',
             style: TextStyle(color: Colors.white,fontSize: 30,
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