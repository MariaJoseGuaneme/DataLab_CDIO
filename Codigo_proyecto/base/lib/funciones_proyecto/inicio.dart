import 'package:base/paginas/p_2.dart';
import 'package:flutter/material.dart';

class PagInicio extends StatefulWidget {
  const PagInicio({ super.key });

  @override
  State<PagInicio> createState() => _PagInicio();
}

class _PagInicio extends State<PagInicio> {
  @override
  Widget build(BuildContext context) { //appBar
    return Scaffold(
     backgroundColor: Colors.white,
     body: inicio(context),
);
}
}

Widget inicio(BuildContext context){
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
            onPressed: (){
              Navigator.push(context,
               MaterialPageRoute(builder:(context) => const PagInicio2() ));
            }, 
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black),
             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)) ),),
            child: const Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 30)),
            ) ,
            
        ],
      )
   );
}

