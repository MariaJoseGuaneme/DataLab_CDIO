import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Creación del controlador de texto
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Es importante limpiar el controlador cuando ya no se necesita.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextEditingController Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter something',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Usar el texto del controlador en alguna funcionalidad
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('You typed: ${_controller.text}'),
                ),
              );
            },
            child: Text('Show what I typed'),
          ),
        ],
      ),
    );
  }
}

