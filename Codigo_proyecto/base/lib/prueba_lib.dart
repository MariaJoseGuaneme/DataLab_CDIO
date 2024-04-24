import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseProvider.dbProvider.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo SQLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Persona> _amigos = [];

  @override
  void initState() {
    super.initState();
    _getAmigosFromDatabase();
  }

  Future<void> _getAmigosFromDatabase() async {
    final amigos = await DatabaseProvider.dbProvider.obtenerPersonas('amigos');
    setState(() {
      _amigos = amigos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar y Mostrar Amigos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AddFriendForm(onDatabaseUpdated: _getAmigosFromDatabase),
              ElevatedButton(
                onPressed: _getAmigosFromDatabase,
                child: const Text('Mostrar Amigos'),
              ),
              ..._amigos.map((amigo) => ListTile(
                title: Text('ID: ${amigo.id}, Nombre: ${amigo.nombre}, Edad: ${amigo.edad}'),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddFriendForm extends StatelessWidget {
  final VoidCallback onDatabaseUpdated;

  AddFriendForm({required this.onDatabaseUpdated});

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nombre',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un nombre';
              }
              return null;
            },
            onSaved: (value) => _name = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Edad',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la edad';
              }
              return null;
            },
            onSaved: (value) => _age = int.parse(value!),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  await DatabaseProvider.dbProvider.addFriend(_name, _age!);
                  onDatabaseUpdated();
                }
              },
              child: const Text('Agregar Amigo'),
            ),
          ),
        ],
      ),
    );
  }
}

class Persona {
  final int? id;
  final String nombre;
  final int edad;

  Persona({this.id, required this.nombre, required this.edad});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'edad': edad,
    };
  }
}

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    var dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, "app_database.db");
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  _createDb(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE amigos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        edad INTEGER
      );
    ''');
  }

  Future<List<Persona>> obtenerPersonas(String tabla) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tabla);
    return List.generate(maps.length, (i) {
      return Persona(
        id: maps[i]['id'],
        nombre: maps[i]['nombre'],
        edad: maps[i]['edad'],
      );
    });
  }

  Future<void> addFriend(String name, int age) async {
    final db = await database;
    await db.insert(
      'amigos',
      {'nombre': name, 'edad': age},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
