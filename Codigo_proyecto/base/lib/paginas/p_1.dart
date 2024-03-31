import 'package:flutter/material.dart';

class PagInicio1 extends StatefulWidget {
  const PagInicio1({ super.key });

  @override
  State<PagInicio1> createState() => _PagInicio1();
}

class _PagInicio1 extends State<PagInicio1> {
  @override
  Widget build(BuildContext context) { //appBar
    return Scaffold(
     backgroundColor: Colors.white,
     body: inicio(),
);
}
}

Widget inicio(){
return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height:400 ,
              width: 400,
              child: Image.asset('assets/logou.jpg'), 
            ),
            const SizedBox(height: 20.0,),
          Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green,width: 4.0),
              borderRadius: BorderRadius.circular(10.0)
            ),

            child: const Center(
            child: Text('¡Bienvenido al sistema de recolección de datos!',
             style: TextStyle(color: Colors.white,fontSize: 30,
              fontWeight: FontWeight.bold,backgroundColor:Colors.green),
            textAlign: TextAlign.center,)
            ),
            ),

            const SizedBox(height: 20.0,),
           ElevatedButton(
            onPressed: (){ }, 
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black),
             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)) ),),
            child: const Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 30)),
            ) ,
            
        ],
      )
   );
}