import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Revisar_practicas.dart';
import 'package:base/preferences.dart';


class PagInicio6 extends StatefulWidget {
  const PagInicio6({super.key});

  @override
  State<PagInicio6> createState() => _PagInicio9();
}

class _PagInicio9 extends State<PagInicio6> {
  @override
  Widget build(BuildContext context) {
    // Obtiene el tamaño de la pantalla
    var size = MediaQuery.of(context).size;

    // Ajusta la relación de aspecto según el diseño deseado
    double buttonWidth = size.width / 2.0;
    double buttonHeight = buttonWidth / 2.0; // Hacer el botón cuadrado o cerca de esa proporción
    double buttonAspectRatio = buttonWidth / buttonHeight;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 21, 110, 34),
            width: double.infinity,
            child:  Text(
              'Selecciona la práctica que quieres revisar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 46.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: GridView.count(
              padding:  EdgeInsets.all(20),
              crossAxisCount: 2,
              crossAxisSpacing: 20.w, // Espacio entre columnas
              mainAxisSpacing: 20.h, // Espacio entre filas
              childAspectRatio: buttonAspectRatio,
              children: <Widget>[
                _buildPracticaButton(context, 'PULPA', const Color.fromARGB(255, 57, 174, 247), () async {
                  await UserPreferences.setPracticaSeleccionada('practica1'); // Guarda 'practica1' para PULPA
                  String practica = UserPreferences.getPracticaSeleccionada();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExcelViewerPage(practica: practica)));
                }),
                _buildPracticaButton(context, 'REFRESCO', const Color.fromARGB(255, 13, 71, 161), () async {
                  await UserPreferences.setPracticaSeleccionada('practica2'); // Guarda 'practica2' para REFRESCO
                  String practica = UserPreferences.getPracticaSeleccionada();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExcelViewerPage(practica: practica))); // Asegúrate de actualizar esto si REFRESCO va a otra página
                }),
              ],
            ),
          ),
          Image.asset(
            'assets/UQ.png',
            width: 200.w,
            height: 200.h,
          ),
        ],
      ),
    );
  }

  Widget _buildPracticaButton(BuildContext context, String etiqueta, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(10), // Añade padding alrededor del botón para más espacio
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: color, // Color del texto del botón
          padding:  EdgeInsets.symmetric(vertical: 16.0.h), // Ajusta el padding dentro del botón
          textStyle: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(etiqueta),
      ),
    );
  }
}