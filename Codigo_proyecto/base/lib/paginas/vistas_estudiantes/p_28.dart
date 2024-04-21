import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecepcionPage28 extends StatelessWidget {
  const RecepcionPage28({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/UQ.png',
              width: 200,
              height: 200,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      color: Colors.green,
                      child: const Text(
                        '15. EMPACADO',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Ingrese las perdidas',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8.0),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingresese las perdidas',
                        hintText: 'Introduzca el %',
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\,?\d*')),
                      ],
                    ),
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      child: const Text('Aceptar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
