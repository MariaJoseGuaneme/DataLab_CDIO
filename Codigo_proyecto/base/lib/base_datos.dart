import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Profesor {
  final int? id;
  final String correo;
  final String contrasena;

  Profesor({this.id, required this.correo, required this.contrasena});

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id_profesores': id, // Incluir solo si id no es null (para insertar nuevos registros).
      'correo': correo,
      'contrasena': contrasena,
    };
  }

  factory Profesor.fromMap(Map<String, dynamic> map) {
    return Profesor(
      id: map['id_profesores'],
      correo: map['correo'],
      contrasena: map['contrasena'],
    );
  }
}

class Estudiante {
  final int? id; // Se asume que es el ID único para el estudiante, autoincremental.
  final int idGrupos; // ID del grupo al que pertenece el estudiante.
  final String correo; // Correo del estudiante.

  Estudiante({this.id, required this.idGrupos, required this.correo});

  // Convertir un Estudiante a un Map. Las claves deben coincidir con los nombres de las columnas de la base de datos.
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'correo': correo,
      'id_grupos': idGrupos,
    };

    // Si tenemos un ID, lo incluimos. Esto es útil para actualizaciones.
    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  // Crear un Estudiante a partir de un Map. Esto es útil cuando se consulta la base de datos.
  factory Estudiante.fromMap(Map<String, dynamic> map) {
    return Estudiante(
      id: map['id'],
      idGrupos: map['id_grupos'],
      correo: map['correo'],
    );
  }
}

class Grupo {
  final int? id;
  final String nombre;
  final int idProfesores;

  Grupo({this.id, required this.nombre, required this.idProfesores});

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id_grupos': id, // Incluir solo si id no es null (para insertar nuevos registros).
      'nombre': nombre,
      'id_profesores': idProfesores,
    };
  }

  factory Grupo.fromMap(Map<String, dynamic> map) {
    return Grupo(
      id: map['id_grupos'],
      nombre: map['nombre'],
      idProfesores: map['id_profesores'],
    );
  }
}

class Practica1 {
  final int idGrupos;
  final int dato1;
  final int dato2;
  // ... continúa con los demás datos hasta dato21

  Practica1({
    required this.idGrupos,
    required this.dato1,
    required this.dato2,
    // ... continúa con los demás datos hasta dato21
  });

  Map<String, dynamic> toMap() {
    return {
      'id_grupos': idGrupos,
      'dato1': dato1,
      'dato2': dato2,
      // ... continúa con los demás datos hasta dato21
    };
  }

  factory Practica1.fromMap(Map<String, dynamic> map) {
    return Practica1(
      idGrupos: map['id_grupos'],
      dato1: map['dato1'],
      dato2: map['dato2'],
      // ... continúa con los demás datos hasta dato21
    );
  }
}



class Practica2 {
  final int idGrupos;
  final int dato1;
  final int dato2;
  // ... continúa con los demás datos hasta dato22

  Practica2({
    required this.idGrupos,
    required this.dato1,
    required this.dato2,
    // ... continúa con los demás datos hasta dato22
  });

  Map<String, dynamic> toMap() {
    return {
      'id_grupos': idGrupos,
      'dato1': dato1,
      'dato2': dato2,
      // ... continúa con los demás datos hasta dato22
    };
  }

  factory Practica2.fromMap(Map<String, dynamic> map) {
    return Practica2(
      idGrupos: map['id_grupos'],
      dato1: map['dato1'],
      dato2: map['dato2'],
      // ... continúa con los demás datos hasta dato22
    );
  }
}



class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('lab_data.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const intType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE profesores (
  id_profesores $idType,
  correo $textType,
  contrasena $textType
)
''');

    await db.execute('''
CREATE TABLE estudiantes (
  id $idType,
  id_grupos $intType,
  correo $textType
)
''');

    await db.execute('''
CREATE TABLE grupos (
  id_grupos $idType,
  nombre $textType,
  id_profesores $intType
)
''');

    await db.execute('''
CREATE TABLE practica_1 (
  id_grupos $intType,
  dato1 $intType,
  dato2 $intType,
  dato3 $intType,
  dato4 $intType,
  dato5 $intType,
  dato6 $intType,
  dato7 $intType,
  dato8 $intType,
  dato9 $intType,
  dato10 $intType,
  dato11 $intType,
  dato12 $intType,
  dato13 $intType,
  dato14 $intType,
  dato15 $intType,
  dato16 $intType,
  dato17 $intType,
  dato18 $intType,
  dato19 $intType,
  dato20 $intType,
  dato21 $intType
)
''');

    await db.execute('''
CREATE TABLE practica_2 (
  id_grupos $intType,
  dato1 $intType,
  dato2 $intType,
  dato3 $intType,
  dato4 $intType,
  dato5 $intType,
  dato6 $intType,
  dato7 $intType,
  dato8 $intType,
  dato9 $intType,
  dato10 $intType,
  dato11 $intType,
  dato12 $intType,
  dato13 $intType,
  dato14 $intType,
  dato15 $intType,
  dato16 $intType,
  dato17 $intType,
  dato18 $intType,
  dato19 $intType,
  dato20 $intType,
  dato21 $intType,
  dato22 $intType
)
''');
  }

  // Insertar un profesor
  Future<int> insertProfesor(Profesor profesor) async {
    final db = await database;
    return await db.insert('profesores', profesor.toMap());
  }

  
  // Leer todos los profesores
  Future<List<Profesor>> getAllProfesores() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('profesores');
    return List.generate(maps.length, (i) {
      return Profesor.fromMap(maps[i]);
    });
  }

  // Leer un profesor por su ID
  Future<Profesor?> getProfesorById(int id) async {
    final db = await database;
    final maps = await db.query('profesores', where: 'id_profesores = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Profesor.fromMap(maps.first);
    }
    return null;
  }

  // Actualizar un profesor
  Future<int> updateProfesor(Profesor profesor) async {
    final db = await database;
    return await db.update(
      'profesores',
      profesor.toMap(),
      where: 'id_profesores = ?',
      whereArgs: [profesor.id],
    );
  }

  // Eliminar un profesor
  Future<int> deleteProfesor(int id) async {
    final db = await database;
    return await db.delete(
      'profesores',
      where: 'id_profesores = ?',
      whereArgs: [id],
    );
  }

  // Insertar un estudiante
  Future<int> insertEstudiante(Estudiante estudiante) async {
    final db = await database;
    return await db.insert('estudiantes', estudiante.toMap());
  }

  // Leer todos los estudiantes
  Future<List<Estudiante>> getAllEstudiantes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('estudiantes');
    return List.generate(maps.length, (i) {
      return Estudiante.fromMap(maps[i]);
    });
  }

  // Leer un estudiante por su ID
  Future<Estudiante?> getEstudianteById(int id) async {
    final db = await database;
    final maps = await db.query('estudiantes', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Estudiante.fromMap(maps.first);
    }
    return null;
  }

  // Actualizar un estudiante
  Future<int> updateEstudiante(Estudiante estudiante) async {
    final db = await database;
    return await db.update(
      'estudiantes',
      estudiante.toMap(),
      where: 'id = ?',
      whereArgs: [estudiante.id],
    );
  }

  // Eliminar un estudiante
  Future<int> deleteEstudiante(int id) async {
    final db = await database;
    return await db.delete(
      'estudiantes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  // Insertar un grupo
  Future<int> insertGrupo(Grupo grupo) async {
    final db = await database;
    return await db.insert('grupos', grupo.toMap());
  }

  // Leer todos los grupos
  Future<List<Grupo>> getAllGrupos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('grupos');
    return List.generate(maps.length, (i) {
      return Grupo.fromMap(maps[i]);
    });
  }

  // Leer un grupo por su ID
  Future<Grupo?> getGrupoById(int id) async {
    final db = await database;
    final maps = await db.query('grupos', where: 'id_grupos = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Grupo.fromMap(maps.first);
    }
    return null;
  }

  // Actualizar un grupo
  Future<int> updateGrupo(Grupo grupo) async {
    final db = await database;
    return await db.update(
      'grupos',
      grupo.toMap(),
      where: 'id_grupos = ?',
      whereArgs: [grupo.id],
    );
  }

  // Eliminar un grupo
  Future<int> deleteGrupo(int id) async {
    final db = await database;
    return await db.delete(
      'grupos',
      where: 'id_grupos = ?',
      whereArgs: [id],
    );
  }

  // Insertar una práctica
  Future<int> insertPractica1(Practica1 practica) async {
    final db = await database;
    return await db.insert('practica_1', practica.toMap());
  }

  // Leer todas las prácticas
  Future<List<Practica1>> getAllPracticas1() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('practica_1');
    return List.generate(maps.length, (i) {
      return Practica1.fromMap(maps[i]);
    });
  }

  // Leer una práctica por el ID de grupo
  Future<Practica1?> getPractica1ByGrupoId(int idGrupos) async {
    final db = await database;
    final maps = await db.query('practica_1', where: 'id_grupos = ?', whereArgs: [idGrupos]);
    if (maps.isNotEmpty) {
      return Practica1.fromMap(maps.first);
    }
    return null;
  }

  // Actualizar una práctica
  Future<int> updatePractica1(Practica1 practica) async {
    final db = await database;
    return await db.update(
      'practica_1',
      practica.toMap(),
      where: 'id_grupos = ?',
      whereArgs: [practica.idGrupos],
    );
  }

  // Eliminar una práctica
  Future<int> deletePractica1(int idGrupos) async {
    final db = await database;
    return await db.delete(
      'practica_1',
      where: 'id_grupos = ?',
      whereArgs: [idGrupos],
    );
  }

  // Insertar una práctica
  Future<int> insertPractica2(Practica2 practica) async {
    final db = await database;
    return await db.insert('practica_2', practica.toMap());
  }

  // Leer todas las prácticas
  Future<List<Practica2>> getAllPracticas2() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('practica_2');
    return List.generate(maps.length, (i) {
      return Practica2.fromMap(maps[i]);
    });
  }

  // Leer una práctica por el ID de grupo
  Future<Practica2?> getPractica2ByGrupoId(int idGrupos) async {
    final db = await database;
    final maps = await db.query('practica_2', where: 'id_grupos = ?', whereArgs: [idGrupos]);
    if (maps.isNotEmpty) {
      return Practica2.fromMap(maps.first);
    }
    return null;
  }

  // Actualizar una práctica
  Future<int> updatePractica2(Practica2 practica) async {
    final db = await database;
    return await db.update(
      'practica_2',
      practica.toMap(),
      where: 'id_grupos = ?',
      whereArgs: [practica.idGrupos],
    );
  }

  // Eliminar una práctica
  Future<int> deletePractica2(int idGrupos) async {
    final db = await database;
    return await db.delete(
      'practica_2',
      where: 'id_grupos = ?',
      whereArgs: [idGrupos],
    );
  }

  // Agregar funciones CRUD aquí...

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
