import 'package:base/paginas/p_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              height:400.h ,
              width: 400.w,
              child: Image.asset('assets/logou.jpg'), 
            ),
            SizedBox(height: 10.0.h,),
          Container(
            width: 500.w,
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green,width: 4.0),
              borderRadius: BorderRadius.circular(10.0)
            ),

            child:  Center(
            child: Text('¡Bienvenido al sistema de recolección de datos!',
             style: TextStyle(color: Colors.white,fontSize: 30.sp,
              fontWeight: FontWeight.bold,backgroundColor:Colors.green),
            textAlign: TextAlign.center,)
            ),
            ),

             SizedBox(height: 20.0.h,),
           ElevatedButton(
            onPressed: (){
              Navigator.push(context,
               MaterialPageRoute(builder:(context) => const PagInicio2() ));
            }, 
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black),
             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0)) ),),
            child:  Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 30.sp)),
            ) ,
            
        ],
      )
   );
}

