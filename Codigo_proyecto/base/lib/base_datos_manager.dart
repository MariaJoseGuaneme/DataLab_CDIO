// database_manager.dart
import 'package:flutter/material.dart';
import 'base_datos.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  factory DatabaseManager() => _instance;
  DatabaseManager._internal();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;


// ESTUDIANTE
  Future<void> insertStudent(String correo, BuildContext context) async {
    if (correo.isNotEmpty) {
      Estudiante newEstudiante = Estudiante(
        idGrupos: 1, // Asumimos que el grupo es siempre 1 //Hay que cambiarlo. 
        correo: correo
      );
      await _dbHelper.insertEstudiante(newEstudiante);
      // Opcional: mostrar una notificación o limpiar el campo de texto
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Estudiante guardado con éxito'))
      );
    } else {
      // Opcional: mostrar un error si el campo está vacío
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, introduce un correo'))
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
        const SnackBar(content: Text('Correo del estudiante actualizado con éxito'))
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
    const SnackBar(content: Text('Todos los estudiantes han sido eliminados')),
  );
}

// Función para borrar un estudiante específico
Future<void> deleteStudent(int id, BuildContext context) async {
  final db = await _dbHelper.database;
  await db.delete('estudiantes', where: 'id = ?', whereArgs: [id]);
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Estudiante eliminado')),
  );
}

// PROFESOR

// Insertar un nuevo profesor
  Future<void> insertProfesor(String correo, String contrasena, BuildContext context) async {
    Profesor newProfesor = Profesor(correo: correo, contrasena: contrasena);

    try {
      await _dbHelper.insertProfesor(newProfesor);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profesor guardado con éxito'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar el profesor: ${e.toString()}'))
      );
    }
  }

  // Leer todos los profesores
  Future<List<Profesor>> getAllProfesores() async {
    return await _dbHelper.getAllProfesores();
  }

  // Actualizar el correo y la contraseña de un profesor
  Future<void> updateProfesor(int id, String newCorreo, String newContrasena, BuildContext context) async {
    Profesor updatedProfesor = Profesor(id: id, correo: newCorreo, contrasena: newContrasena);

    try {
      await _dbHelper.updateProfesor(updatedProfesor);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Datos del profesor actualizados con éxito'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al actualizar los datos del profesor: ${e.toString()}'))
      );
    }
  }

  // Eliminar un profesor por ID
  Future<void> deleteProfesor(int id, BuildContext context) async {
    try {
      await _dbHelper.deleteProfesor(id);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profesor eliminado'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar el profesor: ${e.toString()}'))
      );
    }
  }

  // PRÁCTICA

  // Eliminar una práctica por ID de grupo
  Future<void> deletePractica1(int idGrupos, BuildContext context) async {
    try {
      await _dbHelper.deletePractica(idGrupos);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Práctica eliminada'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar la práctica: ${e.toString()}'))
      );
    }
  }

  // Función para insertar un solo dato en la tabla practica1 con id_grupo fijo
  Future<void> insertSingleDataPractica1(String columnName, dynamic value, BuildContext context) async {
    final db = await _dbHelper.database;
    var exists = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM practica1 WHERE id_grupos = 1'));
    if (exists == 0) {
      // Si no existe, inserta un nuevo registro con `id_grupos` igual a 1.
      await db.insert('practica1', {'id_grupos': 1, columnName: value});
    } else {
      // Si existe, actualiza el registro existente.
      try {
        int count = await _dbHelper.updateSingleDataPractica1(columnName, value);
        if (count != 1)
          {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No se encontró el registro para actualizar'))
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al actualizar el dato: ${e.toString()}'))
        );
      }
    }
  }
}


