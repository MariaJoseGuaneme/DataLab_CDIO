import 'package:flutter/material.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart'; // Asegúrate de que la ruta es correcta

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final _correoController = TextEditingController();
  late DatabaseManager _dbManager;
  List<Estudiante> _estudiantes = [];

  @override
  void initState() {
    super.initState();
    _dbManager = DatabaseManager();
    _loadStudents();
  }

  void _loadStudents() async {
    List<Estudiante> estudiantesList = await _dbManager.getAllStudents();
    setState(() {
      _estudiantes = estudiantesList;
    });
  }

  void _addStudent() async {
    await _dbManager.insertStudent(_correoController.text, context);
    _correoController.clear();
    _loadStudents();
  }

  void _updateStudentEmail(int id, String newEmail) async {
    await _dbManager.updateStudentEmail(id, newEmail, context);
    _loadStudents();
  }

  // Llamado cuando el botón de borrar estudiante es presionado
void _deleteStudent(int id) async {
  await _dbManager.deleteStudent(id, context);
  _loadStudents();
}

// Llamado cuando el botón de borrar todos los estudiantes es presionado
void _deleteAllStudents() async {
  await _dbManager.deleteAllStudents(context);
  _loadStudents();
}

void _showEditDialog(BuildContext context, Estudiante estudiante) {
  final _editEmailController = TextEditingController(text: estudiante.correo);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Editar Correo'),
        content: TextField(
          controller: _editEmailController,
          decoration: InputDecoration(labelText: 'Nuevo correo'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cierra el cuadro de diálogo
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              _updateStudentEmail(estudiante.id!, _editEmailController.text);
              Navigator.of(context).pop(); // Cierra el cuadro de diálogo
            },
            child: Text('Guardar'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
  title: Text('Estudiantes'),
  actions: <Widget>[
    IconButton(
      icon: Icon(Icons.delete_forever),
      onPressed: _deleteAllStudents, // Aquí no necesitas pasar parámetros
      tooltip: 'Borrar todos los estudiantes',
    ),
  ],
),
      body: Column(
        children: [
          TextField(
            controller: _correoController,
            decoration: InputDecoration(labelText: 'Correo del Estudiante'),
          ),
          ElevatedButton(
            onPressed: _addStudent,
            child: Text('Agregar Estudiante'),
          ),
         Expanded(
  child: ListView.builder(
    itemCount: _estudiantes.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(_estudiantes[index].correo),
        subtitle: Text('ID de Grupo: ${_estudiantes[index].idGrupos}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // Esto asegura que el Row solo toma el espacio necesario para sus hijos.
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _showEditDialog(context, _estudiantes[index]),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteStudent(_estudiantes[index].id!), // Asegúrate de que el estudiante tenga un id.
            ),
          ],
        ),
      );
    },
  ),
),
        ],
      ),
    );
  }
}
