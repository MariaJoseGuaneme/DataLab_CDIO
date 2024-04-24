// database_manager.dart
import 'package:flutter/material.dart';
import 'base_datos.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  factory DatabaseManager() => _instance;
  DatabaseManager._internal();

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;



  Future<void> insertStudent(String correo, BuildContext context) async {
    if (correo.isNotEmpty) {
      Estudiante newEstudiante = Estudiante(
        idGrupos: 1, // Asumimos que el grupo es siempre 1 //Hay que cambiarlo. 
        correo: correo
      );

      await _dbHelper.insertEstudiante(newEstudiante);
      // Opcional: mostrar una notificación o limpiar el campo de texto
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Estudiante guardado con éxito'))
      );
    } else {
      // Opcional: mostrar un error si el campo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, introduce un correo'))
      );
    }
  }

Future<List<Estudiante>> getAllStudents() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('estudiantes');

    return List.generate(maps.length, (i) {
      return Estudiante.fromMap(maps[i]);
    });
  }


// Función para actualizar el correo de un estudiante
  Future<void> updateStudentEmail(int id, String newEmail, BuildContext context) async {
    Estudiante updatedEstudiante = Estudiante(id: id, idGrupos: 1, correo: newEmail); // Asumimos que el grupo no cambia

    try {
      await _dbHelper.updateEstudiante(updatedEstudiante);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo del estudiante actualizado con éxito'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar el correo del estudiante: ${e.toString()}'))
      );
    }
  }


// Función para borrar todos los estudiantes
Future<void> deleteAllStudents(BuildContext context) async {
  final db = await _dbHelper.database;
  await db.delete('estudiantes');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Todos los estudiantes han sido eliminados')),
  );
}

// Función para borrar un estudiante específico
Future<void> deleteStudent(int id, BuildContext context) async {
  final db = await _dbHelper.database;
  await db.delete('estudiantes', where: 'id = ?', whereArgs: [id]);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Estudiante eliminado')),
  );
}
}
