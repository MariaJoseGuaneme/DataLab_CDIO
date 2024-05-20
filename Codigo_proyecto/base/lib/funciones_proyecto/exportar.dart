import 'package:sendgrid_mailer/sendgrid_mailer.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart' as excel1;

import '../preferences.dart';


final DatabaseHelper _dbHelper = DatabaseHelper.instance;
int idGrupo = UserPreferences.getIdGrupo();


// Función para enviar correos electrónicos
Future<List<bool>> sendEmail(BuildContext context,String practica) async {
  List<String> recipientEmails = ['marieguaneme@gmail.com'];
  // Suponemos que _dbHelper y idGrupo están definidos y practica también
  List<Estudiante> estudiantes = await _dbHelper.getEstudiantesPorGrupo(idGrupo);
  for (Estudiante e in estudiantes) {
    recipientEmails.add(e.correo);
  }

  final mailer = Mailer('SG.IlM9FcZoSmeG48y8iu50dQ.umVnhh1utuKtigwkx0zz3xgvo8HmbVlPGLOQN1bWK');
  final fromAddress = Address('datalabplus@gmail.com');
  List<bool> results = [];

  for (var recipientEmail in recipientEmails) {
    final toAddress = Address(recipientEmail);
    final content = Content('text/plain', 'Envío de los datos de la '+ practica);
    final subject = 'Envío de datos DataLAB+';

    final String base64File = (await generarArchivo(practica)).toString();
    final attachment = Attachment(base64File, 'Datos.xlsx', type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', disposition: 'attachment');
    final personalization = Personalization([toAddress]);
    final email = Email([personalization], fromAddress, subject, content: [content], attachments: [attachment]);

    try {
      final result = await mailer.send(email);
      results.add(true);
      print('Correo enviado a $recipientEmail: ${result.isValue}');
    } catch (error) {
      results.add(false);
      print('Error enviando correo a $recipientEmail: $error');
    }
  }

  return results;
}

Future <String> generarArchivo(String practica) async {

  print(practica);
  print('de generar archivo');
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
  sheet.cell(excel1.CellIndex.indexByString('B3')).value = excel1.TextCellValue('PROCESAMIENTO DE PRACTICA');
  sheet.merge(excel1.CellIndex.indexByString('B3'), excel1.CellIndex.indexByString('D3'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B3'));
  cell.cellStyle = cellStyle;

  // Siguiente fila de detalles
  sheet.cell(excel1.CellIndex.indexByString('B5')).value = excel1.TextCellValue('Unidades a producir');
  sheet.merge(excel1.CellIndex.indexByString('B5'), excel1.CellIndex.indexByString('C5'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B5'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D5')).value = excel1.TextCellValue(( await _dbHelper.readSpecificData(practica, 'unidades_producir', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D5'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B6')).value = excel1.TextCellValue('Unidades de empaque(gr)');
  sheet.merge(excel1.CellIndex.indexByString('B6'), excel1.CellIndex.indexByString('C6'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B6'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D6')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'unidades_empaque', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D6'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B7')).value = excel1.TextCellValue('Producto a obtener(gr)');
  sheet.merge(excel1.CellIndex.indexByString('B7'), excel1.CellIndex.indexByString('C7'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B7'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D7')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Producto_obtener', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D7'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B9')).value = excel1.TextCellValue('Brix de Fruta');
  sheet.merge(excel1.CellIndex.indexByString('B9'), excel1.CellIndex.indexByString('C9'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B9'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D9')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'brix_fruta', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D9'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('B10')).value = excel1.TextCellValue('Rendimiento de la Fruta (%)');
  sheet.merge(excel1.CellIndex.indexByString('B10'), excel1.CellIndex.indexByString('C10'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B10'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D10')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Rendimiento_fruta', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D10'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B11')).value = excel1.TextCellValue('Pérdidas en el escaldado (%)');
  sheet.merge(excel1.CellIndex.indexByString('B11'), excel1.CellIndex.indexByString('C11'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B11'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D11')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_Escaldado', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D11'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B12')).value = excel1.TextCellValue('Pérdidas en el despulpado (%)');
  sheet.merge(excel1.CellIndex.indexByString('B12'), excel1.CellIndex.indexByString('C12'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B12'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D12')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_despulpado', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D12'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F15')).value = excel1.TextCellValue('Fruta Inicial');
  cell = sheet.cell(excel1.CellIndex.indexByString('F15'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G15')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'peso_inicial', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G15'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F16')).value = excel1.TextCellValue('Cáscara+Semilla');
  cell = sheet.cell(excel1.CellIndex.indexByString('F16'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G16')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'cascara_y_semilla', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G16'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F17')).value = excel1.TextCellValue('Pulpa sin semilla');
  cell = sheet.cell(excel1.CellIndex.indexByString('F17'));
  cell.cellStyle = cellStyle;

  String aux = (await _dbHelper.readSpecificData(practica, 'peso_inicial', idGrupo)).toString();
  String aux2 = (await _dbHelper.readSpecificData('_resultados_' + practica, 'cascara_y_semilla', idGrupo)).toString();
  double n1 = double.parse(aux);
  double n2 = double.parse(aux2);
  String result = (n1-n2).toString();

  sheet.cell(excel1.CellIndex.indexByString('G17')).value = excel1.TextCellValue(result);
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
  sheet.cell(excel1.CellIndex.indexByString('G20')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_despulpado_gr', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G20'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F21')).value = excel1.TextCellValue('Escaldado');
  cell = sheet.cell(excel1.CellIndex.indexByString('F21'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G21')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_Escaldado_gr', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G21'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F22')).value = excel1.TextCellValue('Envasado');
  cell = sheet.cell(excel1.CellIndex.indexByString('F22'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G22')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_empacado_gr', idGrupo)).toString() );
  cell = sheet.cell(excel1.CellIndex.indexByString('G22'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('E9')).value =excel1.TextCellValue('Depende de la fruta');
  sheet.merge(excel1.CellIndex.indexByString('E9'), excel1.CellIndex.indexByString('E10'));
  cell = sheet.cell(excel1.CellIndex.indexByString('E9'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('F9')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'fruta', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('F9'));
  cell.cellStyle = cellStyle;


  if(practica == 'practica1'){
  sheet.cell(excel1.CellIndex.indexByString('B13')).value = excel1.TextCellValue('Pérdidas en el envasado (%)');
  sheet.merge(excel1.CellIndex.indexByString('B13'), excel1.CellIndex.indexByString('C13'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B13'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D13')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_empacado', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D13'));
  cell.cellStyle = cellStyle;



  sheet.cell(excel1.CellIndex.indexByString('B15')).value = excel1.TextCellValue('FORMULACIÓN');
  sheet.merge(excel1.CellIndex.indexByString('B15'), excel1.CellIndex.indexByString('C15'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B15'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D15')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Total_Formulacion', idGrupo)).toString());
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
  sheet.cell(excel1.CellIndex.indexByString('C17')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_pulpa', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C17'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D17')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_pulpa', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D17'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B18')).value = excel1.TextCellValue('Ácido ascórbico');
  cell = sheet.cell(excel1.CellIndex.indexByString('B18'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C18')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_acido_ascorbico', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C18'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D18')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_acidoAscorbico', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D18'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B19')).value = excel1.TextCellValue('Ácido cítrico');
  cell = sheet.cell(excel1.CellIndex.indexByString('B19'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C19')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_acido_citrico', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C19'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D19')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_acidoCitrico', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D19'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B20')).value = excel1.TextCellValue('Benzonato de sodio');
  cell = sheet.cell(excel1.CellIndex.indexByString('B20'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C20')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_benzonato_sodio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C20'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D20')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_benzonatoSodio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D20'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B21')).value = excel1.TextCellValue('Sorbato de potasio');
  cell = sheet.cell(excel1.CellIndex.indexByString('B21'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C21')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_sorbato_potasio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C21'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D21')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_sorbatoPotasio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D21'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B22')).value = excel1.TextCellValue('TOTAL');
  cell = sheet.cell(excel1.CellIndex.indexByString('B22'));
  cell.cellStyle = cellStyle;
  cell = sheet.cell(excel1.CellIndex.indexByString('C22'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D22')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Total_Formulacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D22'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('B25')).value = excel1.TextCellValue('Cantidad de Fruta fresca de acuerdo a la formulación (gr)');
  sheet.merge(excel1.CellIndex.indexByString('B25'), excel1.CellIndex.indexByString('C25'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B25'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D25')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Fruta_fresca_formulacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D25'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B26')).value = excel1.TextCellValue('Cantidad de Fruta fresca real incluyendo pérdidas del proceso(gr)');
  sheet.merge(excel1.CellIndex.indexByString('B26'), excel1.CellIndex.indexByString('C26'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B26'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D26')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Fruta_fresca_real', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D26'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('B28')).value = excel1.TextCellValue('Rendimiento del producto final');
  sheet.merge(excel1.CellIndex.indexByString('B28'), excel1.CellIndex.indexByString('C28'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B28'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D28')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Rendimiento_producto', idGrupo)).toString());
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

  sheet.cell(excel1.CellIndex.indexByString('F6')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'brix_1', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('F6'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G6')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'ph_1', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G6'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('H6')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'acidez_1', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('H6'));
  cell.cellStyle = cellStyle;



  sheet.cell(excel1.CellIndex.indexByString('F25')).value = excel1.TextCellValue('Pulpa para formular');
  cell = sheet.cell(excel1.CellIndex.indexByString('F25'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G25')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_pulpa', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G25'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F26')).value = excel1.TextCellValue('Formulación');
  cell = sheet.cell(excel1.CellIndex.indexByString('F26'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G26')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Total_Formulacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G26'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F27')).value = excel1.TextCellValue('Peso de la pulpa Empacada');
  cell = sheet.cell(excel1.CellIndex.indexByString('F27'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G27')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'peso_pulpa_empacada', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G27'));
  cell.cellStyle = cellStyle;
  }else{


  //Practica 2
  sheet.cell(excel1.CellIndex.indexByString('B13')).value = excel1.TextCellValue('Pérdidas por evaporación (%)');
  sheet.merge(excel1.CellIndex.indexByString('B13'), excel1.CellIndex.indexByString('C13'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B13'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D13')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_evaporacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D13'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B14')).value = excel1.TextCellValue('Pérdidas en el envasado (%)');
  sheet.merge(excel1.CellIndex.indexByString('B14'), excel1.CellIndex.indexByString('C14'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B14'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D14')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_empacado', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D14'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B15')).value = excel1.TextCellValue('Pérdidas en el homogenizado (%)');
  sheet.merge(excel1.CellIndex.indexByString('B15'), excel1.CellIndex.indexByString('C15'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B15'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D15')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_homogenizado', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D15'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('B17')).value = excel1.TextCellValue('FORMULACIÓN');
  sheet.merge(excel1.CellIndex.indexByString('B17'), excel1.CellIndex.indexByString('C17'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B17'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D17')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Total_Formulacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D17'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B18')).value = excel1.TextCellValue('COMPONENTES');
  cell = sheet.cell(excel1.CellIndex.indexByString('B18'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C18')).value = excel1.TextCellValue('%');
  cell = sheet.cell(excel1.CellIndex.indexByString('C18'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D18')).value = excel1.TextCellValue('gr');
  cell = sheet.cell(excel1.CellIndex.indexByString('D18'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B19')).value = excel1.TextCellValue('Pulpa');
  cell = sheet.cell(excel1.CellIndex.indexByString('B19'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C19')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_pulpa', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C19'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D19')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_pulpa', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D19'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B20')).value = excel1.TextCellValue('Azúcar');
  cell = sheet.cell(excel1.CellIndex.indexByString('B20'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C20')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_azucar', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C20'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D20')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_azucar', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D20'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B21')).value = excel1.TextCellValue('Agua');
  cell = sheet.cell(excel1.CellIndex.indexByString('B21'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C21')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_agua', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C21'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D21')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_agua', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D21'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B22')).value = excel1.TextCellValue('CMC');
  cell = sheet.cell(excel1.CellIndex.indexByString('B22'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C22')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_CMC', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C22'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D22')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_CMC', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D22'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B23')).value = excel1.TextCellValue('Ácido ascórbico');
  cell = sheet.cell(excel1.CellIndex.indexByString('B23'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C23')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_acido_ascorbico', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C23'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D23')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_acidoAscorbico', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D23'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B24')).value = excel1.TextCellValue('Benzonato de sodio');
  cell = sheet.cell(excel1.CellIndex.indexByString('B24'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C24')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_benzonato_sodio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C24'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D24')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_benzonatoSodio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D24'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B25')).value = excel1.TextCellValue('Sorbato de potasio');
  cell = sheet.cell(excel1.CellIndex.indexByString('B25'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('C25')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'p_sorbato_potasio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('C25'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D25')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_sorbatoPotasio', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D25'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B26')).value = excel1.TextCellValue('TOTAL');
  cell = sheet.cell(excel1.CellIndex.indexByString('B26'));
  cell.cellStyle = cellStyle;
  cell = sheet.cell(excel1.CellIndex.indexByString('C26'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D26')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Total_Formulacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D26'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('B28')).value = excel1.TextCellValue('Cantidad de Fruta fresca de acuerdo a la formulación (gr)');
  sheet.merge(excel1.CellIndex.indexByString('B28'), excel1.CellIndex.indexByString('C28'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B28'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D28')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Fruta_fresca_formulacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D28'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('B29')).value = excel1.TextCellValue('Cantidad de Fruta fresca real incluyendo pérdidas del proceso(gr)');
  sheet.merge(excel1.CellIndex.indexByString('B29'), excel1.CellIndex.indexByString('C29'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B29'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D29')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Fruta_fresca_real', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D29'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('B31')).value = excel1.TextCellValue('Rendimiento del producto final');
  sheet.merge(excel1.CellIndex.indexByString('B31'), excel1.CellIndex.indexByString('C28'));
  cell = sheet.cell(excel1.CellIndex.indexByString('B31'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('D31')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Rendimiento_producto', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('D31'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('F3')).value = excel1.TextCellValue('PRUEBAS FISICOQUÍMICAS');
  sheet.merge(excel1.CellIndex.indexByString('F3'), excel1.CellIndex.indexByString('I3'));
  cell = sheet.cell(excel1.CellIndex.indexByString('F3'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('G4')).value = excel1.TextCellValue('°Brix');
  cell = sheet.cell(excel1.CellIndex.indexByString('G4'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('H4')).value = excel1.TextCellValue('pH');
  cell = sheet.cell(excel1.CellIndex.indexByString('H4'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('I4')).value = excel1.TextCellValue('Acidez');
  cell = sheet.cell(excel1.CellIndex.indexByString('I4'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F5')).value = excel1.TextCellValue('ANTES');
  cell = sheet.cell(excel1.CellIndex.indexByString('F5'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G5')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'brix_1', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G5'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('H5')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'ph_1', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('H5'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('I5')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'acidez_1', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('I5'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F6')).value = excel1.TextCellValue('DESPUÉS');
  cell = sheet.cell(excel1.CellIndex.indexByString('F6'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G6')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'brix_2', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G6'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('H6')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'ph_2', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('H6'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('I6')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'acidez_2', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('I6'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('F23')).value = excel1.TextCellValue('Evapodaro');
  cell = sheet.cell(excel1.CellIndex.indexByString('F23'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G23')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_evaporacion_gr', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G23'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F24')).value = excel1.TextCellValue('Homogenizado');
  cell = sheet.cell(excel1.CellIndex.indexByString('F24'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G24')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Perdidas_homogenizado_gr', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G24'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F25')).value = excel1.TextCellValue('Olla');
  cell = sheet.cell(excel1.CellIndex.indexByString('F25'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G25')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'perdidas_olla', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G25'));
  cell.cellStyle = cellStyle;


  sheet.cell(excel1.CellIndex.indexByString('F27')).value = excel1.TextCellValue('Pulpa para formular');
  cell = sheet.cell(excel1.CellIndex.indexByString('F27'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G27')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'gr_pulpa', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G27'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F28')).value = excel1.TextCellValue('Formulación');
  cell = sheet.cell(excel1.CellIndex.indexByString('F28'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G28')).value = excel1.TextCellValue((await _dbHelper.readSpecificData('_resultados_' + practica, 'Total_Formulacion', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G28'));
  cell.cellStyle = cellStyle;

  sheet.cell(excel1.CellIndex.indexByString('F29')).value = excel1.TextCellValue('Peso del refresco Empacado');
  cell = sheet.cell(excel1.CellIndex.indexByString('F29'));
  cell.cellStyle = cellStyle;
  sheet.cell(excel1.CellIndex.indexByString('G29')).value = excel1.TextCellValue((await _dbHelper.readSpecificData(practica, 'peso_refresco_empacado', idGrupo)).toString());
  cell = sheet.cell(excel1.CellIndex.indexByString('G29'));
  cell.cellStyle = cellStyle;

  }
  // Guardar el archivo Excel
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/Datos.xlsx';
  var fileBytes = excel.save();
  File file = File(filePath)
  ..createSync(recursive: true)
  ..writeAsBytesSync(fileBytes!);

  // Preparar el archivo para enviarlo como adjunto
  final List<int> fileData = file.readAsBytesSync();
  final String base64File = base64Encode(fileData);
  return base64File;
}

