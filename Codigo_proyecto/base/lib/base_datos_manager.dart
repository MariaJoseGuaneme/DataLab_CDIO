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
          idGrupos: 1,
          // Asumimos que el grupo es siempre 1 //Hay que cambiarlo.
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

  Future<Estudiante?> getEstudianteByEmail(String email) async {
    final db = await _dbHelper.database;
    final maps = await db.query(
      'estudiantes',
      columns: ['id', 'id_grupos', 'correo'],
      where: 'correo = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return Estudiante.fromMap(maps.first);
    } else {
      return null;
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
  Future<void> updateStudentEmail(int id, String newEmail,
      BuildContext context) async {
    Estudiante updatedEstudiante = Estudiante(id: id,
        idGrupos: 1,
        correo: newEmail); // Asumimos que el grupo no cambia
    try {
      await _dbHelper.updateEstudiante(updatedEstudiante);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Correo del estudiante actualizado con éxito'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
              'Error al actualizar el correo del estudiante: ${e.toString()}'))
      );
    }
  }


// Función para borrar todos los estudiantes
  Future<void> deleteAllStudents(BuildContext context) async {
    final db = await _dbHelper.database;
    await db.delete('estudiantes');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Todos los estudiantes han sido eliminados')),
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
  Future<void> insertProfesor(String email, String password,
      BuildContext context) async {
    Profesor newProfesor = Profesor(correo: email, contrasena: password);
    try {
      final db = await _dbHelper.database;
      await db.insert('profesores', newProfesor.toMap());
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profesor registrado exitosamente'))
      );
    } catch (e) {
      print('Error al insertar profesor: $e');
      throw Exception('Failed to insert profesor');
    }
  }

  // Leer todos los profesores
  Future<List<Profesor>> getAllProfesores() async {
    return await _dbHelper.getAllProfesores();
  }

  // Actualizar el correo y la contraseña de un profesor
  Future<void> updateProfesor(int id, String newCorreo, String newContrasena,
      BuildContext context) async {
    Profesor updatedProfesor = Profesor(
        id: id, correo: newCorreo, contrasena: newContrasena);

    try {
      await _dbHelper.updateProfesor(updatedProfesor);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Datos del profesor actualizados con éxito'))
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
              'Error al actualizar los datos del profesor: ${e.toString()}'))
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
          SnackBar(
              content: Text('Error al eliminar el profesor: ${e.toString()}'))
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
          SnackBar(
              content: Text('Error al eliminar la práctica: ${e.toString()}'))
      );
    }
  }

  // Función modificada para insertar o actualizar datos con un idGrupos variable y un nombre de tabla variable
  Future<void> insertSingleDataPractica(String practicaTableName,
      String columnName, dynamic value, int idGrupos,
      BuildContext context) async {
    final db = await _dbHelper.database;
    // Verificar si ya existe un registro para ese idGrupos en la tabla especificada
    var exists = Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT(*) FROM $practicaTableName WHERE id_grupos = ?',
        [idGrupos]));

    if (exists == 0) {
      // Si no existe, inserta un nuevo registro.
      try {
        await db.insert(
            practicaTableName, {'id_grupos': idGrupos, columnName: value});
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
              'Error al insertar en $practicaTableName: ${e.toString()}')),
        );
      }
    } else {
      // Si ya existe, actualiza el registro existente para ese idGrupos.
        int count = await db.update(
            practicaTableName, {columnName: value}, where: 'id_grupos = ?',
            whereArgs: [idGrupos]);
        if (count != 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
                'No se encontró el registro para actualizar en $practicaTableName')),
          );
        }
      }
    }
  }

