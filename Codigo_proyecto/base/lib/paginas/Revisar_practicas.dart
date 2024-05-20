import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:base/funciones_proyecto/exportar.dart';


class ExcelViewerPage extends StatefulWidget {
  final String practica;

  ExcelViewerPage({Key? key, required this.practica}) : super(key: key);

  @override
  _ExcelViewerPageState createState() => _ExcelViewerPageState();
}

class _ExcelViewerPageState extends State<ExcelViewerPage> {
  late Future<List<List<dynamic>>> _excelData;

  @override
  void initState() {
    super.initState();
    // Inicializar con un estado seguro.
    _excelData = Future.value([]);  // Inicia con una lista vacía
    inicializarDatos();
  }

  void inicializarDatos() async {
    await generarArchivo(widget.practica);
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/Datos.xlsx';
    _excelData = readExcelData(filePath);
    setState(() {});  // Notifica al framework que el estado ha cambiado.
  }

  Future<List<List<dynamic>>> readExcelData(String filePath) async {
    File file = File(filePath);
    var bytes = file.readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    List<List<dynamic>> excelData = [];
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        List<dynamic> rowData = row.map((cell) => cell?.value ?? '').toList();
        excelData.add(rowData);
      }
    }
    return excelData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
      body: FutureBuilder<List<List<dynamic>>>(
        future: _excelData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras los datos están siendo cargados
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(child: Text('Cargando...'));
            }
            return createDataTable(snapshot.data!);
          } else {
            // Cubrir cualquier otro estado inesperado
            return Center(child: Text('Unexpected state!'));
          }
        },
      ),
    );
  }

  Widget createDataTable(List<List<dynamic>> data) {
    // Crear las columnas de la DataTable
    List<DataColumn> columns = [];
    if (data.isNotEmpty) {
      columns = data.first.map<DataColumn>(
            (columnTitle) => DataColumn(
            label: Text(columnTitle.toString(), style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold))
        ),
      ).toList();
    }

    // Crear las filas de la DataTable
    List<DataRow> rows = data.skip(1).map<DataRow>(
            (rowData) {
          List<DataCell> cells = rowData.map<DataCell>(
                  (cellItem) => DataCell(Text(cellItem.toString()))
          ).toList();
          return DataRow(cells: cells);
        }
    ).toList();

    // Construir y retornar el DataTable envuelto en dos SingleChildScrollView
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Permite desplazamiento horizontal
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Permite desplazamiento vertical
        child: DataTable(
          columns: columns,
          rows: rows,
          headingRowColor: MaterialStateProperty.all(Colors.grey[200]), // Color de fondo para las cabeceras
          columnSpacing: 10, // Espacio entre columnas
          dataRowHeight: 40, // Altura de las filas de datos
          headingRowHeight: 50, // Altura de la fila de encabezados
          showCheckboxColumn: false, // Decide si mostrar o no la columna de casillas de verificación
          horizontalMargin: 10, // Margen horizontal de las celdas
          dividerThickness: 2, // Grosor del divisor de filas
        ),
      ),
    );
  }
}


