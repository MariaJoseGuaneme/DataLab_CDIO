import 'package:flutter/material.dart';
import 'package:base/base_datos.dart'; // Asegúrate de que la importación es correcta
import 'package:base/funciones_proyecto/select_proceso.dart';
class RecepcionPage24 extends StatefulWidget {
  const RecepcionPage24({super.key});

  @override
  _RecepcionPage24State createState() => _RecepcionPage24State();
}

class _RecepcionPage24State extends State<RecepcionPage24> {
  late Future<Map<String, dynamic>> componentData;

  @override
  void initState() {
    super.initState();
    calcularYGuardarResultados();
    componentData = DatabaseHelper.instance.getComponentData(1);
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                width: double.infinity,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  '12. FORMULACIÓN',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
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
                        columnSpacing: 40,
                        headingRowHeight: 40,
                        dataRowHeight: 40,
                        headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                        dataTextStyle: TextStyle(fontSize: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
