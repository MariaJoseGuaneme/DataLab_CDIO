import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

class User {
  int? id;
  String name;
  int age;

  User({this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }
}

class Product {
  int? id;
  String title;
  double price;

  Product({this.id, required this.title, required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      price: map['price'],
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)
    ''');
    await db.execute('''
      CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, price REAL)
    ''');
  }

  // Métodos CRUD para User
  Future<int> addUser(User user) async {
    final db = await database;
    return db.insert('users', user.toMap());
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    final results = await db.query('users');
    return results.map((map) => User.fromMap(map)).toList();
  }

  // Métodos CRUD para Product
  Future<int> addProduct(Product product) async {
    final db = await database;
    return db.insert('products', product.toMap());
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final results = await db.query('products');
    return results.map((map) => Product.fromMap(map)).toList();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _dbHelper = DatabaseHelper.instance;
  final _userController = TextEditingController();
  final _productController = TextEditingController();
@override
  void dispose() {
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DB Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField( //acá debería dejar guardar lo que ingrese el ususario
              controller: _userController,
              decoration: InputDecoration( labelText: 'Usuario')

            ),
            ElevatedButton(onPressed: () async{
              User newUser = User(name: _userController.text, age: 2);
             await _dbHelper.addUser(newUser);
              print('usuario agregado');
            },
            child: const Text('Añadir usuario'),
            ), //Acá quiero que me llame a la función del databasehelp addUser
            TextField(
              controller: _productController,
              decoration: InputDecoration(labelText: 'Producto'),
            ),
            
            ElevatedButton(
              onPressed: () async {
                Product newProduct = Product(title: _productController.text, price:20);
                await _dbHelper.addProduct(newProduct);
                print('Product added');
              },
              child: Text('Añadir producto'),
            ),

           ElevatedButton(onPressed:() async {
            _showMyDialog(context, _dbHelper);
           } 
           
           
           , child: Text('Mostrar info'))
          ],
        ),
      ),
    );
  }
}
Future<void> _showMyDialog(BuildContext context, final _dbHelper) async {
  List<User> users = await _dbHelper.getUsers();
    List<Product> products = await _dbHelper.getProducts();

    // Prepara los textos para mostrar
    String usersText = users.map((user) => 'Id: ${user.id}, Name: ${user.name}, Age: ${user.age}').join('\n');
    String productsText = products.map((product) => 'Id: ${product.id}, Title: ${product.title}, Price: ${product.price}').join('\n');

     showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Alert Dialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
               Text('Usuarios:\n$usersText'),
                SizedBox(height: 20),
                Text('Productos:\n$productsText'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }
