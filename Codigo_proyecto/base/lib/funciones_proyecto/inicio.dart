import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base/paginas/p_2.dart'; // Asegúrate de que el path al archivo es correcto

class PagInicio extends StatefulWidget {
  const PagInicio({super.key});

  @override
  State<PagInicio> createState() => _PagInicio();
}

class _PagInicio extends State<PagInicio> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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

  Widget inicio(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FadeTransition(
            opacity: _animation!,
            child: Text(
              'DataLab+',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 66.sp,
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 250.h,
            width: 250.w,
            child: Image.asset('assets/logou.jpg'),
          ),
          Container(
            width: 500.w,
            height: 150.h,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green, width: 4.0),
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Center(
              child: Text(
                '¡Bienvenido a DataLab+, tu sistema de recolección de datos del laboratorio de VEGETALES!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 30.0.h),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PagInicio2()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
            ),
            child: Text('Iniciar', style: TextStyle(color: Colors.white, fontSize: 36.sp)),
          ),
          SizedBox(height: 80.0.h)
        ],
      ),
    );
  }

  // Método para mostrar el AlertDialog
  void showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ayuda:'),
          content: Text('Bienvenido a Datalab, en esta aplicación podrás: \n 1. Digitalizar tus prácticas de laboratorio de vegetaqaqqles \n 2. Organizar los datos en las tablas requeridas \n 3. Enviarte los datos por correo \n \n Presiona "iniciar" para continuar con la aplicación'),
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
