import 'package:flutter/material.dart';

class Pag13 extends StatefulWidget {
  const Pag13({ super.key });

  @override
  State<Pag13> createState() => _Pag13();
}

class _Pag13 extends State<Pag13> {
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
          Container(
            width: 300,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green,width: 4.0),
            ),

            child: const Center(
            child: Text('3. PESADO',
             style: TextStyle(color: Colors.white,fontSize: 30,
              fontWeight: FontWeight.bold,backgroundColor:Colors.green),
            textAlign: TextAlign.center,)
            ),
            ),
            const SizedBox(height: 200.0),

            Container(
                width: 300,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 85, 223, 138),
              border: Border.all(color: const Color.fromARGB(255, 104, 203, 102),width: 10),
              borderRadius: BorderRadius.circular(10.0)
            ),

            child: const Center(
            child: Text('Descripción',
             style: TextStyle(color: Colors.white,fontSize: 30,
              fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,)
            ),
              ),

            const SizedBox(height: 20.0,),
           ElevatedButton(
            onPressed: (){ }, 
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black),
             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)) ),),
            child: const Text('Aceptar', style: TextStyle(color: Colors.white, fontSize: 30)),
            ) ,
            SizedBox(
              height:100,
              width: 100,
              child: Image.asset('assets/logou.jpg'), 
            ),
            
        ],
      )
   );
}