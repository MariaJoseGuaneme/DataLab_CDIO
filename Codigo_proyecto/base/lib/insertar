import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para limitar la entrada a números
import 'package:base/base_datos_manager.dart'; // Asegúrate de que la ruta al archivo sea correcta

class InsertarPesoInicialPage extends StatefulWidget {
  const InsertarPesoInicialPage({super.key});

  @override
  _InsertarPesoInicialPageState createState() => _InsertarPesoInicialPageState();
}

class _InsertarPesoInicialPageState extends State<InsertarPesoInicialPage> {
  final _controller = TextEditingController();
  final DatabaseManager _databaseManager = DatabaseManager();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _insertarPesoInicial() async {
    if (_controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, introduce un valor'))
      );
      return;
    }
    int pesoInicial = int.parse(_controller.text);
    // Llama al método del DatabaseManager para actualizar el campo peso_inicial
    await _databaseManager.insertSingleDataPractica1('peso_inicial', pesoInicial, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insertar Peso Inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Peso Inicial',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _insertarPesoInicial,
              child: Text('Guardar Peso Inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
