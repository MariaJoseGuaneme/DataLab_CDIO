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
  final double perdidasEmpacado;

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
    required this.perdidasEmpacado,
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
      'perdidas_empacado': perdidasEmpacado,
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
      perdidasEmpacado: map['perdidas_empacado'] as double,
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
  final double rendimientoFruta;
  final double perdidasDespulpado;
  final double perdidasEmpaquetado;
  final double grPulpa;
  final double grAcidoAscorbico;
  final double grAcidoCitrico;
  final double grBenzonatoSodio;
  final double grSorbatoPotasio;
  final double totalFormulacion;
  final double cascaraYSemilla;
  final double perdidasEscaldado;
  final double perdidasEvaporado;

  ResultadosPractica1({
    required this.idGrupos,
    required this.productoObtener,
    required this.rendimientoFruta,
    required this.perdidasDespulpado,
    required this.perdidasEmpaquetado,
    required this.grPulpa,
    required this.grAcidoAscorbico,
    required this.grAcidoCitrico,
    required this.grBenzonatoSodio,
    required this.grSorbatoPotasio,
    required this.totalFormulacion,
    required this.cascaraYSemilla,
    required this.perdidasEscaldado,
    required this.perdidasEvaporado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_grupos': idGrupos,
      'Producto_obtener': productoObtener,
      'Rendimiento_fruta': rendimientoFruta,
      'Perdidas_despulpado': perdidasDespulpado,
      'Perdidas_empaquetado': perdidasEmpaquetado,
      'gr_pulpa': grPulpa,
      'gr_acidoAscorbico': grAcidoAscorbico,
      'gr_acidoCitrico': grAcidoCitrico,
      'gr_benzonatoSodio': grBenzonatoSodio,
      'gr_sorbatoPotasio': grSorbatoPotasio,
      'Total_Formulacion': totalFormulacion,
      'cascara_y_semilla': cascaraYSemilla,
      'Perdidas_escaldado': perdidasEscaldado,
      'Perdidas_evaporado': perdidasEvaporado,
    };
  }

  factory ResultadosPractica1.fromMap(Map<String, dynamic> map) {
    return ResultadosPractica1(
      idGrupos: map['id_grupos'] as int,
      productoObtener: map['Producto_obtener'] as double,
      rendimientoFruta: map['Rendimiento_fruta'] as double,
      perdidasDespulpado: map['Perdidas_despulpado'] as double,
      perdidasEmpaquetado: map['Perdidas_empaquetado'] as double,
      grPulpa: map['gr_pulpa'] as double,
      grAcidoAscorbico: map['gr_acidoAscorbico'] as double,
      grAcidoCitrico: map['gr_acidoCitrico'] as double,
      grBenzonatoSodio: map['gr_benzonatoSodio'] as double,
      grSorbatoPotasio: map['gr_sorbatoPotasio'] as double,
      totalFormulacion: map['Total_Formulacion'] as double,
      cascaraYSemilla: map['cascara_y_semilla'] as double,
      perdidasEscaldado: map['Perdidas_escaldado'] as double,
      perdidasEvaporado: map['Perdidas_evaporado'] as double,
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

    return await openDatabase(
        path, version: 3, onCreate: _createDB, onUpgrade: _onUpgrade);
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
  fruta TEXT NOT NULL,
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
  perdidas_empacado REAL NOT NULL DEFAULT 0.0
)
''');

    await db.execute('''
CREATE TABLE practica_2 (
  id_grupos INTEGER NOT NULL,
  dato1 $realType,
  dato2 $realType,
  dato3 $realType,
  dato4 $realType,
  dato5 $realType,
  dato6 $realType,
  dato7 $realType,
  dato8 $realType,
  dato9 $realType,
  dato10 $realType,
  dato11 $realType,
  dato12 $realType,
  dato13 $realType,
  dato14 $realType,
  dato15 $realType,
  dato16 $realType,
  dato17 $realType,
  dato18 $realType,
  dato19 $realType,
  dato20 $realType,
  dato21 $realType,
  dato22 $realType
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
  Total_Formulacion REAL NOT NULL DEFAULT 0,
  gr_pulpa REAL NOT NULL DEFAULT 0,
  gr_acidoAscorbico REAL NOT NULL DEFAULT 0,
  gr_acidoCitrico REAL NOT NULL DEFAULT 0,
  gr_benzonatoSodio REAL NOT NULL DEFAULT 0,
  gr_sorbatoPotasio REAL NOT NULL DEFAULT 0,
  Fruta_fresca_formulacion REAL NOT NULL DEFAULT 0,
  Fruta_fresca_real REAL NOT NULL DEFAULT 0,
  Rendimiento_producto REAL NOT NULL DEFAULT 0,
  
  FOREIGN KEY (id_grupos) REFERENCES practica1 (id_grupos)
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
    final maps = await db.query(
        'estudiantes', where: 'id = ?', whereArgs: [id]);
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

  // Eliminar un grupo
  Future<int> deleteGrupo(int id) async {
    final db = await database;
    return await db.delete(
      'grupos',
      where: 'id_grupos = ?',
      whereArgs: [id],
    );
  }


// Leer una práctica por su ID de grupo
  Future<Practica1?> getPractica1ByIdGrupos(int idGrupos) async {
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
        '_resultados_practica1', where: 'id_grupos = ?', whereArgs: [idGrupos]);
  }

  // Función para actualizar un solo dato en practica1
  Future<int> updateSingleDataPractica1(String columnName,dynamic value) async {
    final db = await database;
    return await db.rawUpdate(
        'UPDATE practica1 SET $columnName = ? WHERE id_grupos = 1',
        [value]
    );
  }

  Future<int> updateColumnaResultadoPractica1(int idGrupos,String nombreColumna, dynamic valor) async {
    final db = await database;
    return await db.update(
      '_resultados_practica1',
      {nombreColumna: valor},
      where: 'id_grupos = ?',
      whereArgs: [idGrupos],
    );
  }

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

  Future<int> insertValorColumnaResultadoPractica1(int idGrupos,
      String nombreColumna, dynamic valor) async {
    final db = await database;
    // Suponiendo que todas las demás columnas se pueden dejar con valores predeterminados o NULL
    final data = { 'id_grupos': idGrupos, nombreColumna: valor};
    return await db.insert('_resultados_practica1', data);
  }

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

  //A continuación se presentan las funciones de get para obtener los valores iniciales

  Future<String> getFruta() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['fruta'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['fruta'];
    }
    return 'Na';
  }

  Future<double> getUnidades_producir() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['unidades_producir'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['unidades_producir'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getUnidades_empaque() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['unidades_empaque'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['unidades_empaque'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getTiempo_escaldado() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['tiempo_escaldado'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['tiempo_escaldado']?? 0.0;
    }
    return 0.0;
  }

  Future<double> getTiempo_enfriamiento() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['tiempo_enfriamiento'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['tiempo_enfriamiento'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getP_pulpa() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['p_pulpa'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['p_pulpa'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getP_acido_ascorbico() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['p_acido_ascorbico'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['p_acido_ascorbico'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getP_acido_citrico() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['p_acido_citrico'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['p_acido_citrico'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getP_benzonato_sodio() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['p_benzonato_sodio'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['p_benzonato_sodio'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getP_sorbato_potasio() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['p_sorbato_potasio'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['p_sorbato_potasio'] ?? 0.0;
    }
    return 0.0;
  }
  Future<double> getPesoInicial() async {
    final db = await database;
    // Asumiendo que 'peso_inicial' es el nombre de la columna para el peso en tu tabla practica1.
    final List<Map<String, dynamic>> result = await db.query(
      'practica1',
      columns: ['peso_inicial'],
      orderBy: 'id_grupos DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first['peso_inicial'] ?? 0.0;
    } else {
      // Devuelve un valor predeterminado o maneja la ausencia de datos.
      return 0;
    }
  }


  Future<double> getPesoEscaldado() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'practica1',
      columns: ['peso_escaldado'],  // Asegúrate que el nombre de la columna está correcto
      orderBy: 'id_grupos DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first['peso_escaldado'] ?? 0.0;
    } else {
      return 0;  // Devuelve un valor predeterminado o maneja la ausencia de datos
    }
  }

  Future<double> getPesoCascara() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'practica1',
      columns: ['peso_cascara'],
      orderBy: 'id_grupos DESC',
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first['peso_cascara'] ?? 0.0; // Asegúrate de manejar los valores nulos.
    } else {
      return 0; // Devuelve un valor predeterminado o maneja la ausencia de datos.
    }
  }
  Future<double> getPesoPulpa() async {
    final db = await database;

    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['peso_pulpa'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_pulpa'] ?? 0.0;
    } else {
      return 0; // Devuelve un valor predeterminado o maneja la ausencia de datos.
    }
  }

  Future<double> getPesoSemillas() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['peso_semillas'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas'] ?? 0.0;
    }
    return 0.0;
  }

  // En tu DatabaseManager
  Future<double> getBrix1() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['brix_1'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getPh1() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['ph_1'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getAcidez1() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['acidez_1'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas'] ?? 0.0;
    }
    return 0.0;
  }


// En tu DatabaseManager
  Future<double> getBrix2() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['brix_2'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getPh2() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['ph_2'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas'] ?? 0.0;
    }
    return 0.0;
  }

  Future<double> getAcidez2() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['acidez_2'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas']?? 0.0;
    }
    return 0.0;
  }

  Future<double> getPerdidas_empacado() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('practica1', columns: ['perdidas_empacado'], orderBy: 'id_grupos DESC', limit: 1);
    if (result.isNotEmpty) {
      return result.first['peso_semillas'] ?? 0.0;
    }
    return 0.0;
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    //if (oldVersion < 2) {
    // Aquí agregarías el SQL para modificar la estructura de la base de datos
    // Ejemplo: Agregar la columna 'fruta' a la tabla 'practica1'
    // await db.execute('ALTER TABLE practica1 ADD COLUMN fruta TEXT NOT NULL DEFAULT "N/D";');
    //  await db.execute('DROP TABLE nombre_tabla');
    //}

    Future close() async {
      final db = await instance.database;

      db.close();
    }
  }
}
