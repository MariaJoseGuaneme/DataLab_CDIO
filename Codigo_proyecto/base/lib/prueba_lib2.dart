import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Creación del controlador de texto
  final TextEditingController _controller = TextEditingController();

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
        title: const Text('TextEditingController Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
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
            child: const Text('Show what I typed'),
          ),
        ],
      ),
    );
  }
}

