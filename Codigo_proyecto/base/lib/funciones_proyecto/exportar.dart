import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
//import 'package:csv/csv.dart';
import 'package:excel/excel.dart' as excel1;

// Lista de correos electrónicos remitentes
List<String> recipientEmails = [
  'marlons.espinosaj@gmail.com',
  'mateo.vargasc@uqvirtual.edu.co',
  'mateovarcla@gmail.com'
  //'juanp.aricapab@uqvirtual.edu.co',
  //'mariaj.guanemeb@uqvirtual.edu.co',
  //'josed.perezz@uqvirtual.edu.co',
  //'marlons.espinosaj@uqvirtual.edu.co'
  //'perezo.santiago@uqvirtual.edu.co'
  // Añade más correos según necesites
];

//final DatabaseHelper _dbHelper = DatabaseHelper.instance;

// Función para enviar correos electrónicos
void sendEmail(BuildContext context) async {
  print('Cualquier mensaje');
  // Crear una instancia de Mailer con tu clave API de SendGrid
  final mailer = Mailer('');
  //final String filePath = await _dbHelper.guardarDatosMarlon();
  //final File attachmentFile = File(filePath);

  // Dirección de correo electrónico desde donde se enviarán los correos
  final fromAddress = Address('datalabplus@gmail.com');

  // Bucle para enviar un correo a cada dirección en la lista de remitentes
  // Bucle para enviar un correo a cada dirección en la lista de remitentes
  for (var recipientEmail in recipientEmails) {
    final toAddress = Address(recipientEmail);
    final content = Content('text/plain', 'Para que después no digan que no sirve hps');
    final subject = 'Prueba de envío de datos DataLAB+';
    
    // Leer el archivo como binario para el adjunto
   final excel1.Excel excel = excel1.Excel.createExcel(); // Crea una nueva instancia de Excel
    final excel1.Sheet sheet = excel['Sheet1']; // Usar la primera hoja
    excel1.CellStyle cellStyle = excel1.CellStyle(textWrapping: excel1.TextWrapping.WrapText,
    leftBorder: excel1.Border(borderStyle: excel1.BorderStyle.Thin),
    rightBorder: excel1.Border(borderStyle: excel1.BorderStyle.Thin),
    topBorder: excel1.Border(borderStyle: excel1.BorderStyle.Thin),
    bottomBorder: excel1.Border(borderStyle: excel1.BorderStyle.Thin),);
    var cell;
  
    sheet.setColumnWidth(1,15);
    sheet.setColumnWidth(5,15);
   
    // Añadir algunos datos y combinar celdas
    sheet.cell(excel1.CellIndex.indexByString('B3')).value = excel1.TextCellValue('PROCESAMIENTO DE PULPAS');
    sheet.merge(excel1.CellIndex.indexByString('B3'), excel1.CellIndex.indexByString('D3'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B3'));
    cell.cellStyle = cellStyle;
  
    // Siguiente fila de detalles
    sheet.cell(excel1.CellIndex.indexByString('B5')).value = excel1.TextCellValue('Unidades a producir');
    sheet.merge(excel1.CellIndex.indexByString('B5'), excel1.CellIndex.indexByString('C5'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B5'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D5')).value = excel1.TextCellValue('25');
    cell = sheet.cell(excel1.CellIndex.indexByString('D5'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B6')).value = excel1.TextCellValue('Unidades de empaque(gr)');
    sheet.merge(excel1.CellIndex.indexByString('B6'), excel1.CellIndex.indexByString('C6'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B6'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D6')).value = excel1.TextCellValue('250');
    cell = sheet.cell(excel1.CellIndex.indexByString('D6'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B7')).value = excel1.TextCellValue('Producto a obtener(gr)');
    sheet.merge(excel1.CellIndex.indexByString('B7'), excel1.CellIndex.indexByString('C7'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B7'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D7')).value = excel1.TextCellValue('6250');
    cell = sheet.cell(excel1.CellIndex.indexByString('D7'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B9')).value = excel1.TextCellValue('Brix de Fruta');
    sheet.merge(excel1.CellIndex.indexByString('B9'), excel1.CellIndex.indexByString('C9'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B9'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D9')).value = excel1.TextCellValue('12');
    cell = sheet.cell(excel1.CellIndex.indexByString('D9'));
    cell.cellStyle = cellStyle;


    sheet.cell(excel1.CellIndex.indexByString('B10')).value = excel1.TextCellValue('Rendimiento de la Fruta (%)');
    sheet.merge(excel1.CellIndex.indexByString('B10'), excel1.CellIndex.indexByString('C10'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B10'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D10')).value = excel1.TextCellValue('74.24565339');
    cell = sheet.cell(excel1.CellIndex.indexByString('D10'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B11')).value = excel1.TextCellValue('Pérdidas en el escaldado (%)');
    sheet.merge(excel1.CellIndex.indexByString('B11'), excel1.CellIndex.indexByString('C11'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B11'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D11')).value = excel1.TextCellValue('0');
    cell = sheet.cell(excel1.CellIndex.indexByString('D11'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B12')).value = excel1.TextCellValue('Pérdidas en el despulpado (%)');
    sheet.merge(excel1.CellIndex.indexByString('B12'), excel1.CellIndex.indexByString('C12'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B12'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D12')).value = excel1.TextCellValue('5.665508385');
    cell = sheet.cell(excel1.CellIndex.indexByString('D12'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B13')).value = excel1.TextCellValue('Pérdidas en el envasado (%)');
    sheet.merge(excel1.CellIndex.indexByString('B13'), excel1.CellIndex.indexByString('C13'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B13'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D13')).value = excel1.TextCellValue('5.761803331');
    cell = sheet.cell(excel1.CellIndex.indexByString('D13'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('E9')).value =excel1.TextCellValue('Depende de la fruta');
    sheet.merge(excel1.CellIndex.indexByString('E9'), excel1.CellIndex.indexByString('E10'));
    cell = sheet.cell(excel1.CellIndex.indexByString('E9'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('F9')).value = excel1.TextCellValue('Mango');
    cell = sheet.cell(excel1.CellIndex.indexByString('F9'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('E12')).value = excel1.TextCellValue('Depende de la despulpadora y la fruta');
    sheet.merge(excel1.CellIndex.indexByString('E12'), excel1.CellIndex.indexByString('G12'));
    cell = sheet.cell(excel1.CellIndex.indexByString('E12'));
    cell.cellStyle = cellStyle;


    sheet.cell(excel1.CellIndex.indexByString('B15')).value = excel1.TextCellValue('FORMULACIÓN');
    sheet.merge(excel1.CellIndex.indexByString('B15'), excel1.CellIndex.indexByString('C15'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B15'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D15')).value = excel1.TextCellValue('6257.767');
    cell = sheet.cell(excel1.CellIndex.indexByString('D15'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B16')).value = excel1.TextCellValue('COMPONENTES');
    cell = sheet.cell(excel1.CellIndex.indexByString('B16'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('C16')).value = excel1.TextCellValue('%');
    cell = sheet.cell(excel1.CellIndex.indexByString('C16'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D16')).value = excel1.TextCellValue('gr');
    cell = sheet.cell(excel1.CellIndex.indexByString('D16'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B17')).value = excel1.TextCellValue('Pulpa');
    cell = sheet.cell(excel1.CellIndex.indexByString('B17'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('C17')).value = excel1.TextCellValue('99.78');
    cell = sheet.cell(excel1.CellIndex.indexByString('C17'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D17')).value = excel1.TextCellValue('6244');
    cell = sheet.cell(excel1.CellIndex.indexByString('D17'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B18')).value = excel1.TextCellValue('Ácido ascórbico');
    cell = sheet.cell(excel1.CellIndex.indexByString('B18'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('C18')).value = excel1.TextCellValue('0.1');
    cell = sheet.cell(excel1.CellIndex.indexByString('C18'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D18')).value = excel1.TextCellValue('6.3');
    cell = sheet.cell(excel1.CellIndex.indexByString('D18'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B19')).value = excel1.TextCellValue('Ácido cítrico');
    cell = sheet.cell(excel1.CellIndex.indexByString('B19'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('C19')).value = excel1.TextCellValue('0.05');
    cell = sheet.cell(excel1.CellIndex.indexByString('C19'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D19')).value = excel1.TextCellValue('3.1');
    cell = sheet.cell(excel1.CellIndex.indexByString('D19'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B20')).value = excel1.TextCellValue('Benzoato de sodio');
    cell = sheet.cell(excel1.CellIndex.indexByString('B20'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('C20')).value = excel1.TextCellValue('0.03');
    cell = sheet.cell(excel1.CellIndex.indexByString('C20'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D20')).value = excel1.TextCellValue('1.9');
    cell = sheet.cell(excel1.CellIndex.indexByString('D20'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B21')).value = excel1.TextCellValue('Sorbato de potasio');
    cell = sheet.cell(excel1.CellIndex.indexByString('B21'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('C21')).value = excel1.TextCellValue('0.04');
    cell = sheet.cell(excel1.CellIndex.indexByString('C21'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D21')).value = excel1.TextCellValue('2.5');
    cell = sheet.cell(excel1.CellIndex.indexByString('D21'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B22')).value = excel1.TextCellValue('TOTAL');
    cell = sheet.cell(excel1.CellIndex.indexByString('B22'));
    cell.cellStyle = cellStyle;
    cell = sheet.cell(excel1.CellIndex.indexByString('C22'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D22')).value = excel1.TextCellValue('6257.8');
    cell = sheet.cell(excel1.CellIndex.indexByString('D22'));
    cell.cellStyle = cellStyle;


    sheet.cell(excel1.CellIndex.indexByString('B25')).value = excel1.TextCellValue('Cantidad de Fruta fresca de acuerdo a la formulación (gr)');
    sheet.merge(excel1.CellIndex.indexByString('B25'), excel1.CellIndex.indexByString('C25'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B25'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D25')).value = excel1.TextCellValue('110210.8');
    cell = sheet.cell(excel1.CellIndex.indexByString('D25'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('B26')).value = excel1.TextCellValue('Cantidad de Fruta fresca real incluyendo pérdidas del proceso(gr)');
    sheet.merge(excel1.CellIndex.indexByString('B26'), excel1.CellIndex.indexByString('C26'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B26'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D26')).value = excel1.TextCellValue('116829.8');
    cell = sheet.cell(excel1.CellIndex.indexByString('D26'));
    cell.cellStyle = cellStyle;


    sheet.cell(excel1.CellIndex.indexByString('B28')).value = excel1.TextCellValue('Rendimiento del producto final');
    sheet.merge(excel1.CellIndex.indexByString('B28'), excel1.CellIndex.indexByString('C28'));
    cell = sheet.cell(excel1.CellIndex.indexByString('B28'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('D28')).value = excel1.TextCellValue('99.87588224');
    cell = sheet.cell(excel1.CellIndex.indexByString('D28'));
    cell.cellStyle = cellStyle;


    sheet.cell(excel1.CellIndex.indexByString('F4')).value = excel1.TextCellValue('PRUEBAS FISICOQUÍMICAS');
    sheet.merge(excel1.CellIndex.indexByString('F4'), excel1.CellIndex.indexByString('H4'));
    cell = sheet.cell(excel1.CellIndex.indexByString('F4'));
    cell.cellStyle = cellStyle;
  
    sheet.cell(excel1.CellIndex.indexByString('F5')).value = excel1.TextCellValue('°Brix');
    cell = sheet.cell(excel1.CellIndex.indexByString('F5'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G5')).value = excel1.TextCellValue('pH');
    cell = sheet.cell(excel1.CellIndex.indexByString('G5'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('H5')).value = excel1.TextCellValue('Acidez');
    cell = sheet.cell(excel1.CellIndex.indexByString('H5'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F6')).value = excel1.TextCellValue('12');
    cell = sheet.cell(excel1.CellIndex.indexByString('F6'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G6')).value = excel1.TextCellValue('4.3');
    cell = sheet.cell(excel1.CellIndex.indexByString('G6'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('H6')).value = excel1.TextCellValue('3.072');
    cell = sheet.cell(excel1.CellIndex.indexByString('H6'));
    cell.cellStyle = cellStyle;
 

    sheet.cell(excel1.CellIndex.indexByString('F15')).value = excel1.TextCellValue('Fruta Inicial');
    cell = sheet.cell(excel1.CellIndex.indexByString('F15'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G15')).value = excel1.TextCellValue('8915');
    cell = sheet.cell(excel1.CellIndex.indexByString('G15'));
    cell.cellStyle = cellStyle;
 
    sheet.cell(excel1.CellIndex.indexByString('F16')).value = excel1.TextCellValue('Cáscara+Semilla');
    cell = sheet.cell(excel1.CellIndex.indexByString('F16'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G16')).value = excel1.TextCellValue('2296');
    cell = sheet.cell(excel1.CellIndex.indexByString('G16'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F17')).value = excel1.TextCellValue('Pulpa sin semilla');
    cell = sheet.cell(excel1.CellIndex.indexByString('F17'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G17')).value = excel1.TextCellValue('6619'); 
    cell = sheet.cell(excel1.CellIndex.indexByString('G17'));
    cell.cellStyle = cellStyle;


    sheet.cell(excel1.CellIndex.indexByString('F19')).value = excel1.TextCellValue('Pérdidas');
    cell = sheet.cell(excel1.CellIndex.indexByString('F19'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G19')).value = excel1.TextCellValue('gr');
    cell = sheet.cell(excel1.CellIndex.indexByString('G19'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F20')).value = excel1.TextCellValue('Despulpado');
    cell = sheet.cell(excel1.CellIndex.indexByString('F20'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G20')).value = excel1.TextCellValue('375');
    cell = sheet.cell(excel1.CellIndex.indexByString('G20'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F21')).value = excel1.TextCellValue('Escaldado');
    cell = sheet.cell(excel1.CellIndex.indexByString('F21'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G21')).value = excel1.TextCellValue('0');
    cell = sheet.cell(excel1.CellIndex.indexByString('G21'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F22')).value = excel1.TextCellValue('Envasado');
    cell = sheet.cell(excel1.CellIndex.indexByString('F22'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G22')).value = excel1.TextCellValue('359.767');
    cell = sheet.cell(excel1.CellIndex.indexByString('G22'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F23')).value = excel1.TextCellValue('Evaporado');
    cell = sheet.cell(excel1.CellIndex.indexByString('F23'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G23')).value = excel1.TextCellValue('0');
    cell = sheet.cell(excel1.CellIndex.indexByString('G23'));
    cell.cellStyle = cellStyle;


    sheet.cell(excel1.CellIndex.indexByString('F25')).value = excel1.TextCellValue('Pulpa para formular');
    cell = sheet.cell(excel1.CellIndex.indexByString('F25'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G25')).value = excel1.TextCellValue('6244');
    cell = sheet.cell(excel1.CellIndex.indexByString('G25'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F26')).value = excel1.TextCellValue('Formulación');
    cell = sheet.cell(excel1.CellIndex.indexByString('F26'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G26')).value = excel1.TextCellValue('6257.77');
    cell = sheet.cell(excel1.CellIndex.indexByString('G26'));
    cell.cellStyle = cellStyle;

    sheet.cell(excel1.CellIndex.indexByString('F27')).value = excel1.TextCellValue('Empacada');
    cell = sheet.cell(excel1.CellIndex.indexByString('F27'));
    cell.cellStyle = cellStyle;
    sheet.cell(excel1.CellIndex.indexByString('G27')).value = excel1.TextCellValue('5898');
    cell = sheet.cell(excel1.CellIndex.indexByString('G27'));
    cell.cellStyle = cellStyle;

  
    // Guardar el archivo Excel
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/estudiantes.xlsx';
    var fileBytes = excel.save();
    File file = File(filePath)
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);

    // Preparar el archivo para enviarlo como adjunto
    final List<int> fileData = file.readAsBytesSync();
    final String base64File = base64Encode(fileData);


    // Crear el adjunto con el contenido en base64
    final attachment = Attachment(base64File,'estudiantes.xlsx',type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',disposition: 'attachment');

    final personalization = Personalization([toAddress]);
    final email = Email([personalization], fromAddress, subject, content: [content], attachments: [attachment]);

    try {
      final result = await mailer.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo enviado a $recipientEmail: ${result.isValue}'))
      );
    } catch (error) {
      print('Error enviando correo a $recipientEmail: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error enviando correo a $recipientEmail: $error'))
      );
    }
  }
}