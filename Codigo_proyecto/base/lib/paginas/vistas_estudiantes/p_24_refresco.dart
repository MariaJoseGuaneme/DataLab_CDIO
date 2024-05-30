import 'package:flutter/material.dart';
import 'package:base/base_datos.dart'; // Asegúrate de que la importación es correcta
import 'package:base/funciones_proyecto/select_proceso_pulpa.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../preferences.dart';
import 'p_25.dart';
class RecepcionPage24_refresco extends StatefulWidget {
  const RecepcionPage24_refresco({super.key});

  @override
  _RecepcionPage24State_refresco createState() => _RecepcionPage24State_refresco();
}

class _RecepcionPage24State_refresco extends State<RecepcionPage24_refresco> {
  late Future<Map<String, dynamic>> componentData;
  int idGrupo = UserPreferences.getIdGrupo();
  String practica = UserPreferences.getPracticaSeleccionada();

  @override
  void initState() {
    super.initState();
    calcularYGuardarResultados();
    componentData = DatabaseHelper.instance.getComponentData2(idGrupo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulación")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                width: double.infinity,
                color: Colors.green,
                alignment: Alignment.center,
                child:  Text(
                  '12. FORMULACIÓN',
                  style: TextStyle(color: Colors.white, fontSize: 35.sp),
                  textAlign: TextAlign.center,
                ),
              ),
               SizedBox(height: 24.h),
              FutureBuilder<Map<String, dynamic>>(
                future: componentData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2), // Bordes exteriores negros
                      ),
                      child: DataTable(
                        columnSpacing: 40.w,
                        headingRowHeight: 40.h,
                        dataRowHeight: 40,
                        headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.sp),
                        dataTextStyle: TextStyle(fontSize: 20.sp),
                        columns: const [
                          DataColumn(label: Text('Componente')),
                          DataColumn(label: Text('Gramos')),
                          DataColumn(label: Text('% del Total')),
                        ],
                        rows: (data['Componentes'] as List).map<DataRow>((component) => DataRow(
                          cells: [
                            DataCell(Text(component['name'])),
                            DataCell(Text('${component['grams'].toStringAsFixed(2)}')),
                            DataCell(Text('${(component['percentage']).toStringAsFixed(2)}%')),
                          ],
                        )).toList()
                          ..add(
                            DataRow(
                              cells: [
                                DataCell(Text('Total')),
                                DataCell(Text('${data['Total_Formulacion'].toStringAsFixed(2)}')),
                                DataCell(Text('100%')),
                              ],
                            ),
                          ),
                      ),
                    );
                  } else {
                    return Text("No data available");
                  }
                },
              ),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 200.w, // Esto forzará al botón a expandirse al máximo ancho permitido por el contenedor
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => RecepcionPage25()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      // Añadir padding vertical si es necesario para aumentar la altura del botón
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
                    ),
                    child: Text('Continuar', style: TextStyle(color: Colors.white, fontSize: 30.sp)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
