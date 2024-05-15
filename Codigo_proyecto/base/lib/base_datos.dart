import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


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
  final String fruta;
  final double unidadesProducir;
  final double unidadesEmpaque;
  final double tiempoEscaldado;
  final double tiempoEnfriamiento;
  final double pPulpa;
  final double pAcidoAscorbico;
  final double pAcidoCitrico;
  final double pBenzonatoSodio;
  final double pSorbatoPotasio;
  final double pesoInicial;
  final double pesoEscaldado;
  final double pesoCascara;
  final double pesoPulpa;
  final double pesoSemillas;
  final double brix1;
  final double ph1;
  final double acidez1;
  final double brix2;
  final double ph2;
  final double acidez2;
  final double perdidasolla;
  final double perdidasOllaEmpacado;
  final double brixFruta;
  final double pesoPulpaEmpacada;

  Practica1({
    required this.idGrupos,
    required this.fruta,
    required this.unidadesProducir,
    required this.unidadesEmpaque,
    required this.tiempoEscaldado,
    required this.tiempoEnfriamiento,
    required this.pPulpa,
    required this.pAcidoAscorbico,
    required this.pAcidoCitrico,
    required this.pBenzonatoSodio,
    required this.pSorbatoPotasio,
    required this.pesoInicial,
    required this.pesoEscaldado,
    required this.pesoCascara,
    required this.pesoPulpa,
    required this.pesoSemillas,
    required this.brix1,
    required this.ph1,
    required this.acidez1,
    required this.brix2,
    required this.ph2,
    required this.acidez2,
    required this.perdidasolla,
    required this.perdidasOllaEmpacado,
    required this.brixFruta,
    required this.pesoPulpaEmpacada,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_grupos': idGrupos,
      'fruta': fruta,
      'unidades_producir': unidadesProducir,
      'unidades_empaque': unidadesEmpaque,
      'tiempo_escaldado': tiempoEscaldado,
      'tiempo_enfriamiento': tiempoEnfriamiento,
      'p_pulpa': pPulpa,
      'p_acido_ascorbico': pAcidoAscorbico,
      'p_acido_citrico': pAcidoCitrico,
      'p_benzonato_sodio': pBenzonatoSodio,
      'p_sorbato_potasio': pSorbatoPotasio,
      'peso_inicial': pesoInicial,
      'peso_escaldado': pesoEscaldado,
      'peso_cascara': pesoCascara,
      'peso_pulpa': pesoPulpa,
      'peso_semillas': pesoSemillas,
      'brix_1': brix1,
      'ph_1': ph1,
      'acidez_1': acidez1,
      'brix_2': brix2,
      'ph_2': ph2,
      'acidez_2': acidez2,
      'perdidas_olla': perdidasolla,
      'persidas_olla_empacado' : perdidasOllaEmpacado,
      'brix_fruta' : brixFruta,
      'peso_pulpa_empacada' : pesoPulpaEmpacada,

    };
  }

  factory Practica1.fromMap(Map<String, dynamic> map) {
    return Practica1(
      idGrupos: map['id_grupos'] as int,
      fruta: map['fruta'] as String,
      unidadesProducir: map['unidades_producir'] as double,
      unidadesEmpaque: map['unidades_empaque'] as double,
      tiempoEscaldado: map['tiempo_escaldado'] as double,
      tiempoEnfriamiento: map['tiempo_enfriamiento'] as double,
      pPulpa: map['p_pulpa'] as double,
      pAcidoAscorbico: map['p_acido_ascorbico'] as double,
      pAcidoCitrico: map['p_acido_citrico'] as double,
      pBenzonatoSodio: map['p_benzonato_sodio'] as double,
      pSorbatoPotasio: map['p_sorbato_potasio'] as double,
      pesoInicial: map['peso_inicial'] as double,
      pesoEscaldado: map['peso_escaldado'] as double,
      pesoCascara: map['peso_cascara'] as double,
      pesoPulpa: map['peso_pulpa'] as double,
      pesoSemillas: map['peso_semillas'] as double,
      brix1: map['brix_1'] as double,
      ph1: map['ph_1'] as double,
      acidez1: map['acidez_1'] as double,
      brix2: map['brix_2'] as double,
      ph2: map['ph_2'] as double,
      acidez2: map['acidez_2'] as double,
      perdidasolla: map['perdidas_empacado'] as double,
      perdidasOllaEmpacado: map['perdidas_olla_empacado'] as double,
      brixFruta: map['brix_fruta'] as double,
      pesoPulpaEmpacada: map['peso_pulpa_empacada'] as double,
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

class ResultadosPractica1 {
  final int idGrupos;
  final double productoObtener;
  final double cascara_y_semilla;
  final double rendimientoFruta;
  final double perdidasDespulpado;
  final double perdidasDespulpado_gr;
  final double perdidasEscaldado_gr;
  final double perdidasEscaldado;
  final double perdidasEmpacado_gr;
  final double perdidasEmpacado;
  final double totalFormulacion;
  final double grPulpa;
  final double grAcidoAscorbico;
  final double grAcidoCitrico;
  final double grBenzonatoSodio;
  final double grSorbatoPotasio;
  final double frutaFrescaFormulacion;
  final double frutaFrescaReal; // Añadido para coincidir con la tabla
  final double rendimientoProducto; // Añadido para coincidir con la tabla
  final double acidez1;
  final double acidez2;

  ResultadosPractica1({
    required this.idGrupos,
    required this.productoObtener,
    required this.cascara_y_semilla,
    required this.rendimientoFruta,
    required this.perdidasDespulpado,
    required this.perdidasDespulpado_gr,
    required this.perdidasEscaldado_gr,
    required this.perdidasEscaldado,
    required this.perdidasEmpacado_gr,
    required this.perdidasEmpacado,
    required this.totalFormulacion,
    required this.grPulpa,
    required this.grAcidoAscorbico,
    required this.grAcidoCitrico,
    required this.grBenzonatoSodio,
    required this.grSorbatoPotasio,
    required this.frutaFrescaFormulacion,
    required this.frutaFrescaReal,
    required this.rendimientoProducto,
    required this.acidez1,
    required this.acidez2,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_grupos': idGrupos,
      'Producto_obtener': productoObtener,
      'cascara_y_semilla': cascara_y_semilla,
      'Rendimiento_fruta': rendimientoFruta,
      'Perdidas_despulpado': perdidasDespulpado,
      'Perdidas_despulpado_gr': perdidasDespulpado_gr,
      'Perdidas_Escaldado_gr': perdidasEscaldado_gr,
      'Perdidas_Escaldado': perdidasEscaldado,
      'Perdidas_empacado_gr': perdidasEmpacado_gr,
      'Perdidas_empacado': perdidasEmpacado,
      'Total_Formulacion': totalFormulacion,
      'gr_pulpa': grPulpa,
      'gr_acidoAscorbico': grAcidoAscorbico,
      'gr_acidoCitrico': grAcidoCitrico,
      'gr_benzonatoSodio': grBenzonatoSodio,
      'gr_sorbatoPotasio': grSorbatoPotasio,
      'Fruta_fresca_formulacion': frutaFrescaFormulacion,
      'Fruta_fresca_real': frutaFrescaReal,
      'Rendimiento_producto': rendimientoProducto,
      'Acidez1': acidez1,
      'Acidez2': acidez2,
    };
  }

  factory ResultadosPractica1.fromMap(Map<String, dynamic> map) {
    return ResultadosPractica1(
      idGrupos: map['id_grupos'] as int,
      productoObtener: map['Producto_obtener'] as double,
      cascara_y_semilla: map['cascara_y_semilla'] as double,
      rendimientoFruta: map['Rendimiento_fruta'] as double,
      perdidasDespulpado: map['Perdidas_despulpado'] as double,
      perdidasDespulpado_gr: map['Perdidas_despulpado_gr'] as double,
      perdidasEscaldado_gr: map['Perdidas_Escaldado_gr'] as double,
      perdidasEscaldado: map['Perdidas_Escaldado'] as double,
      perdidasEmpacado_gr: map['Perdidas_empacado_gr'] as double,
      perdidasEmpacado: map['Perdidas_empacado'] as double,
      totalFormulacion: map['Total_Formulacion'] as double,
      grPulpa: map['gr_pulpa'] as double,
      grAcidoAscorbico: map['gr_acidoAscorbico'] as double,
      grAcidoCitrico: map['gr_acidoCitrico'] as double,
      grBenzonatoSodio: map['gr_benzonatoSodio'] as double,
      grSorbatoPotasio: map['gr_sorbatoPotasio'] as double,
      frutaFrescaFormulacion: map['Fruta_fresca_formulacion'] as double,
      frutaFrescaReal: map['Fruta_fresca_real'] as double,
      rendimientoProducto: map['Rendimiento_producto'] as double,
      acidez1: map['Acidez1'] as double,
      acidez2: map['Acidez2'] as double,
    );
  }
}

// DATA BASE HELPER ----------------------------------------------------------------------------------
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

    return await openDatabase(
        path, version: 12, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const realType = 'REAL NOT NULL'; // Tipo para valores double
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
  id_grupos INTEGER NOT NULL,
  correo $textType
)
''');

    await db.execute('''
CREATE TABLE grupos (
  id_grupos $idType,
  nombre $textType,
  id_profesores INTEGER NOT NULL
)
''');

    await db.execute('''
CREATE TABLE practica1 (
  id_grupos INTEGER PRIMARY KEY,
  fruta TEXT NOT NULL DEFAULT 'Na',
  unidades_producir REAL NOT NULL DEFAULT 0.0,
  unidades_empaque REAL NOT NULL DEFAULT 0.0,
  tiempo_escaldado REAL NOT NULL DEFAULT 0.0,
  tiempo_enfriamiento REAL NOT NULL DEFAULT 0.0,
  p_pulpa REAL NOT NULL DEFAULT 0.0,
  p_acido_ascorbico REAL NOT NULL DEFAULT 0.0,
  p_acido_citrico REAL NOT NULL DEFAULT 0.0,
  p_benzonato_sodio REAL NOT NULL DEFAULT 0.0,
  p_sorbato_potasio REAL NOT NULL DEFAULT 0.0,
  peso_inicial REAL NOT NULL DEFAULT 0.0,
  peso_escaldado REAL NOT NULL DEFAULT 0.0,
  peso_cascara REAL NOT NULL DEFAULT 0.0,
  peso_pulpa REAL NOT NULL DEFAULT 0.0,
  peso_semillas REAL NOT NULL DEFAULT 0.0,
  brix_1 REAL NOT NULL DEFAULT 0.0,
  ph_1 REAL NOT NULL DEFAULT 0.0,
  acidez_1 REAL NOT NULL DEFAULT 0.0,
  brix_2 REAL NOT NULL DEFAULT 0.0,
  ph_2 REAL NOT NULL DEFAULT 0.0,
  acidez_2 REAL NOT NULL DEFAULT 0.0,
  perdidas_olla REAL NOT NULL DEFAULT 0.0,
  perdidas_olla_empacado REAL NOT NULL DEFAULT 0.0
  brix_fruta REAL NOT NULL DEFAULT 0.0,
  peso_pulpa_empacada REAL NOT NULL DEFAULT 0.0
  
)
''');


    await db.execute('''
CREATE TABLE practica2 (
  id_grupos INTEGER PRIMARY KEY,
  fruta TEXT NOT NULL DEFAULT 'Na',
  unidades_producir REAL NOT NULL DEFAULT 0.0,
  unidades_empaque REAL NOT NULL DEFAULT 0.0,
  tiempo_escaldado REAL NOT NULL DEFAULT 0.0,
  tiempo_enfriamiento REAL NOT NULL DEFAULT 0.0,
  p_pulpa REAL NOT NULL DEFAULT 0.0,
  p_azucar REAL NOT NULL DEFAULT 0.0,
  p_agua REAL NOT NULL DEFAULT 0.0,
  p_CMC REAL NOT NULL DEFAULT 0.0,
  p_acido_ascorbico REAL NOT NULL DEFAULT 0.0,
  p_benzonato_sodio REAL NOT NULL DEFAULT 0.0,
  p_sorbato_potasio REAL NOT NULL DEFAULT 0.0,
  peso_inicial REAL NOT NULL DEFAULT 0.0,
  peso_escaldado REAL NOT NULL DEFAULT 0.0,
  peso_cascara REAL NOT NULL DEFAULT 0.0,
  peso_pulpa REAL NOT NULL DEFAULT 0.0,
  peso_semillas REAL NOT NULL DEFAULT 0.0,
  brix_1 REAL NOT NULL DEFAULT 0.0,
  ph_1 REAL NOT NULL DEFAULT 0.0,
  acidez_1 REAL NOT NULL DEFAULT 0.0,
  brix_2 REAL NOT NULL DEFAULT 0.0,
  ph_2 REAL NOT NULL DEFAULT 0.0,
  acidez_2 REAL NOT NULL DEFAULT 0.0,
  perdidas_olla REAL NOT NULL DEFAULT 0.0,
  perdidas_olla_empacado REAL NOT NULL DEFAULT 0.0
  brix_fruta REAL NOT NULL DEFAULT 0.0,
  peso_refresco_empacado REAL NOT NULL DEFAULT 0.0
  peso_ebullicion REAL NOT NULL DEFAULT 0.0,
  peso_homogenizacion REAL NOT NULL DEFAULT 0.0
  
)
''');


    await db.execute('''
CREATE TABLE _resultados_practica1 (
  id_grupos INTEGER PRIMARY KEY,
  Producto_obtener REAL NOT NULL DEFAULT 0,
  cascara_y_semilla REAL NOT NULL DEFAULT 0,
  Rendimiento_fruta REAL NOT NULL DEFAULT 0,
  Perdidas_despulpado REAL NOT NULL DEFAULT 0,
  Perdidas_despulpado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_Escaldado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_Escaldado REAL NOT NULL DEFAULT 0,
  Perdidas_empacado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_empacado REAL NOT NULL DEFAULT 0,
  Total_Formulacion REAL NOT NULL DEFAULT 0,
  gr_pulpa REAL NOT NULL DEFAULT 0,
  gr_acidoAscorbico REAL NOT NULL DEFAULT 0,
  gr_acidoCitrico REAL NOT NULL DEFAULT 0,
  gr_benzonatoSodio REAL NOT NULL DEFAULT 0,
  gr_sorbatoPotasio REAL NOT NULL DEFAULT 0,
  Fruta_fresca_formulacion REAL NOT NULL DEFAULT 0,
  Fruta_fresca_real REAL NOT NULL DEFAULT 0,
  Rendimiento_producto REAL NOT NULL DEFAULT 0,
  Acidez1 REAL NOT NULL DEFAULT 0,
  Acidez2 REAL NOT NULL DEFAULT 0,
  
  
  FOREIGN KEY (id_grupos) REFERENCES practica1 (id_grupos)
)
''');

    await db.execute('''
CREATE TABLE _resultados_practica2 (
  id_grupos INTEGER PRIMARY KEY,
  Producto_obtener REAL NOT NULL DEFAULT 0,
  cascara_y_semilla REAL NOT NULL DEFAULT 0,
  Rendimiento_fruta REAL NOT NULL DEFAULT 0,
  Perdidas_despulpado REAL NOT NULL DEFAULT 0,
  Perdidas_despulpado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_Escaldado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_Escaldado REAL NOT NULL DEFAULT 0,
  Perdidas_empacado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_empacado REAL NOT NULL DEFAULT 0,
  Perdidas_evaporacion_gr REAL NOT NULL DEFAULT 0,
  Perdidas_evaporacion REAL NOT NULL DEFAULT 0,
  Perdidas_homogenizado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_homogenizado REAL NOT NULL DEFAULT 0,
  Total_Formulacion REAL NOT NULL DEFAULT 0,
  gr_pulpa REAL NOT NULL DEFAULT 0,
  gr_azucar REAL NOT NULL DEFAULT 0,
  gr_agua REAL NOT NULL DEFAULT 0,
  gr_CMC REAL NOT NULL DEFAULT 0,
  gr_acidoAscorbico REAL NOT NULL DEFAULT 0,
  gr_benzonatoSodio REAL NOT NULL DEFAULT 0,
  gr_sorbatoPotasio REAL NOT NULL DEFAULT 0,
  Fruta_fresca_formulacion REAL NOT NULL DEFAULT 0,
  Fruta_fresca_real REAL NOT NULL DEFAULT 0,
  Rendimiento_producto REAL NOT NULL DEFAULT 0,
  Acidez1 REAL NOT NULL DEFAULT 0,
  Acidez2 REAL NOT NULL DEFAULT 0,
  perdidas_olla_gr REAL NOT NULL DEFAULT 0,
  
  
  FOREIGN KEY (id_grupos) REFERENCES practica1 (id_grupos)
)
''');

  }


// FUNCIONES DE PROFESOR ------------------------------------------------------

  // Insertar un profesor
  Future<int> insertProfesor(Profesor profesor) async {
    final db = await database;
    return await db.insert('profesores', profesor.toMap());
  }


  Future<Profesor?> getProfesorByEmail(String email) async {
    final db = await database;
    final maps = await db.query(
      'profesores',
      columns: ['id_profesores', 'correo', 'contrasena'],
      where: 'correo = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return Profesor.fromMap(maps.first);
    } else {
      return null;
    }
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
    final maps = await db.query(
        'profesores', where: 'id_profesores = ?', whereArgs: [id]);
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


  // FUNCIONES ESTUDIANTE -----------------------------------------------------

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

  Future<List<Estudiante>> getEstudiantesPorGrupo(int idGrupo) async {                 // FUNCIÓN MATEO 5
    final db = await database;  // Obtiene la instancia de la base de datos
    final List<Map<String, dynamic>> maps = await db.query(
        'estudiantes',  // Asume que la tabla se llama 'estudiantes'
        where: 'id_grupos = ?',  // Usa el nombre correcto de la columna para el ID del grupo
        whereArgs: [idGrupo]
    );

    if (maps.isNotEmpty) {
      return List.generate(maps.length, (i) {
        return Estudiante.fromMap(maps[i]);
      });
    } else {
      return [];  // Retorna una lista vacía si no hay estudiantes
    }
  }

  // Esta función genera el archivo CSV de los estudiantes
  Future<String> generateStudentsCSV() async {
    final db = await instance.database;
    final data = await db.query('estudiantes');
    final directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/students.csv');
    print('${directory.path}/students.csv');

    // Crea o sobrescribe el archivo CSV
    String csvData = 'ID, Grupo ID, Correo\n';
    for (var row in data) {
      csvData += '${row['id']},${row['id_grupos']},${row['correo']}\n';
    }
    await file.writeAsString(csvData);

    return file.path; // Devuelve la ruta del archivo
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

  Future<void> deleteAllEstudiantesAndResetAutoincrement() async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.rawDelete("DELETE FROM estudiantes"); // Borra todos los registros
      await txn.rawInsert("DELETE FROM sqlite_sequence WHERE name='estudiantes'"); // Restablece el autoincremental
    });
  }

// FUNCIONES GRUPO ------------------------------------------------------------

  // Método en DatabaseManager para insertar grupo
  Future<int> insertGrupo(String nombre, int idProfesor) async {
    final db = await database;
    return await db.insert('grupos', {
      'nombre': nombre,
      'id_profesores': idProfesor
    });
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
    final maps = await db.query(
        'grupos', where: 'id_grupos = ?', whereArgs: [id]);
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

  Future<List<Grupo>> getGruposPorProfesor(int idProfesor) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
        'grupos',
        where: 'id_profesores = ?',
        whereArgs: [idProfesor]
    );

    return List.generate(maps.length, (i) => Grupo.fromMap(maps[i]));
  }

  // Método en DatabaseManager para eliminar grupo
  Future<void> deleteGrupo(int idGrupo) async {
    final db = await database;
    await db.delete(
        'grupos',
        where: 'id_grupos = ?',
        whereArgs: [idGrupo]
    );
  }

  Future<void> deleteAllGruposAndResetAutoincrement() async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.rawDelete("DELETE FROM grupos"); // Borra todos los registros
      await txn.rawInsert("DELETE FROM sqlite_sequence WHERE name='grupos'"); // Restablece el autoincremental
    });
  }

// FUNIONES PRÁCTICA ---------------------------------------------------------
// Leer una práctica por su ID de grupo
  Future<Practica1?> getPractica1ByIdGrupos(int idGrupos) async {                // OPCIÓN MATEO
    final db = await database;
    final maps = await db.query(
        'practica1', where: 'id_grupos = ?', whereArgs: [idGrupos]);
    if (maps.isNotEmpty) {
      return Practica1.fromMap(maps.first);
    }
    return null;
  }


// Eliminar una práctica
  Future<int> deletePractica(int idGrupos) async {
    final db = await database;
    return await db.delete(
        'practica1', where: 'id_grupos = ?', whereArgs: [idGrupos]);
  }

  Future<void> borrarRegistroPractica() async {
    final db = await database;
    await db.transaction((txn) async {
      await txn.rawDelete("DELETE FROM '_resultados_practica1'"); // Borra todos los registros
      await txn.rawInsert("DELETE FROM sqlite_sequence WHERE name = '_resultados_practica1'"); // Restablece el autoincremental
    });
  }


  // Función para actualizar un solo dato en practica1
  Future<int> updateSingleDataPractica1(String columnName,dynamic value) async {
    final db = await database;
    return await db.rawUpdate(
        'UPDATE practica1 SET $columnName = ? WHERE id_grupos = 1',
        [value]
    );
  }

  // Actualizar un valor de una columna de los resultados de la practica1
  Future<int> updateColumnaResultadoPractica1(int idGrupos,String nombreColumna, dynamic valor) async {
    final db = await database;
    return await db.update(
      '_resultados_practica1',
      {nombreColumna: valor},
      where: 'id_grupos = ?',
      whereArgs: [idGrupos],
    );
  }

  // Eliminar un Valor de una columna de los resultados de la practica1
  Future<int> deleteValorColumnaResultadoPractica1(int idGrupos,String nombreColumna) async {
    final db = await database;
    return await db.update(
      '_resultados_practica1',
      {nombreColumna: null},
      // O establecer en un valor predeterminado si la columna no acepta null.
      where: 'id_grupos = ?',
      whereArgs: [idGrupos],
    );
  }

  // Insertar un valor de una columna de los resultados de la practica1
  Future<int> insertValorColumnaResultadoPractica1(int idGrupos,
      String nombreColumna, dynamic valor) async {
    final db = await database;
    // Suponiendo que todas las demás columnas se pueden dejar con valores predeterminados o NULL
    final data = { 'id_grupos': idGrupos, nombreColumna: valor};
    return await db.insert('_resultados_practica1', data);
  }

  // Leer un valor de una columna de los resultados de la practica1
  Future<dynamic> leerValorColumnaResultadoPractica1(int idGrupos,
      String nombreColumna) async {
    final db = await database;
    final maps = await db.query(
      '_resultados_practica1',
      columns: [nombreColumna],
      where: 'id_grupos = ?',
      whereArgs: [idGrupos],
    );
    if (maps.isNotEmpty) {
      return maps.first[nombreColumna];
    }
    return null;
  }

  Future<dynamic> readSpecificData(String tableName, int idGrupos, String columnName) async { //OPCIÓN PRINCIPAL DE MATEO
    final db = await instance.database;
    final maps = await db.query(
      tableName,
      columns: [columnName],
      where: 'id_grupos = ?',
      whereArgs: [idGrupos],
    );

    if (maps.isNotEmpty) {
      return maps.first[columnName];
    }
    throw Exception('ID not found');
  }

  // FUNCIONES GET --------------------------------------------------------------

  Future<double> getNumericValue(String tableName, String columnName, int idGrupo) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
        tableName,
        columns: [columnName],
        where: 'id_grupos = ?',
        whereArgs: [idGrupo]
    );
    if (result.isNotEmpty && result.first[columnName] != null) {
      return result.first[columnName] as double;
    }
    return 0.0;
  }

  Future<String> getTextValue(String tableName, String columnName, int idGrupo) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
        tableName,
        columns: [columnName],
        where: 'id_grupos = ?',
        whereArgs: [idGrupo]
    );
    if (result.isNotEmpty && result.first[columnName] != null) {
      return result.first[columnName] as String;
    }
    return 'Na';
  }

  // PARA LA FORMULACIÓN ------------------------------------------------------

  Future<Map<String, dynamic>> getComponentData1(int idGrupo) async {
    final db = await database;
    // Recuperar porcentajes de la tabla practica1
    final Map<String, dynamic> percentages = (await db.query(
        'practica1',
        columns: ['p_pulpa', 'p_acido_ascorbico', 'p_acido_citrico', 'p_benzonato_sodio', 'p_sorbato_potasio'],
        where: 'id_grupos = ?',
        whereArgs: [idGrupo]
    )).first;

    // Recuperar gramos de la tabla _resultados_practica1
    final Map<String, dynamic> grams = (await db.query(
        '_resultados_practica1',
        columns: ['Total_Formulacion', 'gr_pulpa', 'gr_acidoAscorbico', 'gr_acidoCitrico', 'gr_benzonatoSodio', 'gr_sorbatoPotasio'],
        where: 'id_grupos = ?',
        whereArgs: [idGrupo]
    )).first;

    // Calcular porcentajes y retornar datos combinados
    return {
      "Total_Formulacion": grams['Total_Formulacion'],
      "Componentes": [
        {"name": "Pulpa", "grams": grams['gr_pulpa'], "percentage": percentages['p_pulpa']},
        {"name": "Ácido Ascórbico", "grams": grams['gr_acidoAscorbico'], "percentage": percentages['p_acido_ascorbico']},
        {"name": "Ácido Cítrico", "grams": grams['gr_acidoCitrico'], "percentage": percentages['p_acido_citrico']},
        {"name": "Benzoato de Sodio", "grams": grams['gr_benzonatoSodio'], "percentage": percentages['p_benzonato_sodio']},
        {"name": "Sorbato de Potasio", "grams": grams['gr_sorbatoPotasio'], "percentage": percentages['p_sorbato_potasio']}
      ]
    };
  }

  Future<Map<String, dynamic>> getComponentData2(int idGrupo) async {
    final db = await database;
    // Recuperar porcentajes de la tabla practica2
    final Map<String, dynamic> percentages = (await db.query(
        'practica2',
        columns: ['p_pulpa', 'p_azucar', 'p_agua', 'p_CMC', 'p_acido_ascorbico', 'p_benzonato_sodio', 'p_sorbato_potasio'],
        where: 'id_grupos = ?',
        whereArgs: [idGrupo]
    )).first;

    // Recuperar gramos de la tabla _resultados_practica2
    final Map<String, dynamic> grams = (await db.query(
        '_resultados_practica2',
        columns: ['Total_Formulacion', 'gr_pulpa', 'gr_azucar', 'gr_agua', 'gr_CMC', 'gr_acidoAscorbico', 'gr_benzonatoSodio', 'gr_sorbatoPotasio'],
        where: 'id_grupos = ?',
        whereArgs: [idGrupo]
    )).first;

    // Calcular porcentajes y retornar datos combinados
    return {
      "Total_Formulacion": grams['Total_Formulacion'],
      "Componentes": [
        {"name": "Pulpa", "grams": grams['gr_pulpa'], "percentage": percentages['p_pulpa']},
        {"name": "Azúcar", "grams": grams['gr_azucar'], "percentage": percentages['p_azucar']},
        {"name": "Agua", "grams": grams['gr_agua'], "percentage": percentages['p_agua']},
        {"name": "CMC", "grams": grams['gr_CMC'], "percentage": percentages['p_CMC']},
        {"name": "Ácido Ascórbico", "grams": grams['gr_acidoAscorbico'], "percentage": percentages['p_acido_ascorbico']},
        {"name": "Benzoato de Sodio", "grams": grams['gr_benzonatoSodio'], "percentage": percentages['p_benzonato_sodio']},
        {"name": "Sorbato de Potasio", "grams": grams['gr_sorbatoPotasio'], "percentage": percentages['p_sorbato_potasio']}
      ]
    };
  }



  // VERSIONES BASE DE DATOS -------------------------------------------------
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    //if (oldVersion < 2) {
    // Aquí agregarías el SQL para modificar la estructura de la base de datos
    // Ejemplo: Agregar la columna 'fruta' a la tabla 'practica1'
    // await db.execute('ALTER TABLE practica1 ADD COLUMN fruta TEXT NOT NULL DEFAULT "N/D";');
    //  await db.execute('DROP TABLE nombre_tabla');
    //}

    if (oldVersion < 13) {
      await db.execute('''
CREATE TABLE practica2 (
  id_grupos INTEGER PRIMARY KEY,
  fruta TEXT NOT NULL DEFAULT 'Na',
  unidades_producir REAL NOT NULL DEFAULT 0.0,
  unidades_empaque REAL NOT NULL DEFAULT 0.0,
  tiempo_escaldado REAL NOT NULL DEFAULT 0.0,
  tiempo_enfriamiento REAL NOT NULL DEFAULT 0.0,
  p_pulpa REAL NOT NULL DEFAULT 0.0,
  p_azucar REAL NOT NULL DEFAULT 0.0,
  p_agua REAL NOT NULL DEFAULT 0.0,
  p_CMC REAL NOT NULL DEFAULT 0.0,
  p_acido_ascorbico REAL NOT NULL DEFAULT 0.0,
  p_benzonato_sodio REAL NOT NULL DEFAULT 0.0,
  p_sorbato_potasio REAL NOT NULL DEFAULT 0.0,
  peso_inicial REAL NOT NULL DEFAULT 0.0,
  peso_escaldado REAL NOT NULL DEFAULT 0.0,
  peso_cascara REAL NOT NULL DEFAULT 0.0,
  peso_pulpa REAL NOT NULL DEFAULT 0.0,
  peso_semillas REAL NOT NULL DEFAULT 0.0,
  brix_1 REAL NOT NULL DEFAULT 0.0,
  ph_1 REAL NOT NULL DEFAULT 0.0,
  acidez_1 REAL NOT NULL DEFAULT 0.0,
  brix_2 REAL NOT NULL DEFAULT 0.0,
  ph_2 REAL NOT NULL DEFAULT 0.0,
  acidez_2 REAL NOT NULL DEFAULT 0.0,
  perdidas_olla REAL NOT NULL DEFAULT 0.0,
  perdidas_olla_empacado REAL NOT NULL DEFAULT 0.0,
  brix_fruta REAL NOT NULL DEFAULT 0.0,
  peso_refresco_empacado REAL NOT NULL DEFAULT 0.0,
  peso_ebullicion REAL NOT NULL DEFAULT 0.0,
  peso_homogenizacion REAL NOT NULL DEFAULT 0.0
  
)
''');

      await db.execute('''
CREATE TABLE _resultados_practica2 (
  id_grupos INTEGER PRIMARY KEY,
  Producto_obtener REAL NOT NULL DEFAULT 0,
  cascara_y_semilla REAL NOT NULL DEFAULT 0,
  Rendimiento_fruta REAL NOT NULL DEFAULT 0,
  Perdidas_despulpado REAL NOT NULL DEFAULT 0,
  Perdidas_despulpado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_Escaldado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_Escaldado REAL NOT NULL DEFAULT 0,
  Perdidas_empacado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_empacado REAL NOT NULL DEFAULT 0,
  Perdidas_evaporacion_gr REAL NOT NULL DEFAULT 0,
  Perdidas_evaporacion REAL NOT NULL DEFAULT 0,
  Perdidas_homogenizado_gr REAL NOT NULL DEFAULT 0,
  Perdidas_homogenizado REAL NOT NULL DEFAULT 0,
  Total_Formulacion REAL NOT NULL DEFAULT 0,
  gr_pulpa REAL NOT NULL DEFAULT 0,
  gr_azucar REAL NOT NULL DEFAULT 0,
  gr_agua REAL NOT NULL DEFAULT 0,
  gr_CMC REAL NOT NULL DEFAULT 0,
  gr_acidoAscorbico REAL NOT NULL DEFAULT 0,
  gr_benzonatoSodio REAL NOT NULL DEFAULT 0,
  gr_sorbatoPotasio REAL NOT NULL DEFAULT 0,
  Fruta_fresca_formulacion REAL NOT NULL DEFAULT 0,
  Fruta_fresca_real REAL NOT NULL DEFAULT 0,
  Rendimiento_producto REAL NOT NULL DEFAULT 0,
  Acidez1 REAL NOT NULL DEFAULT 0,
  Acidez2 REAL NOT NULL DEFAULT 0,
  perdidas_olla_gr REAL NOT NULL DEFAULT 0,
  
  
  FOREIGN KEY (id_grupos) REFERENCES practica2 (id_grupos)
)
''');

    }
    Future close() async {
      final db = await instance.database;

      db.close();
    }
  }
}
