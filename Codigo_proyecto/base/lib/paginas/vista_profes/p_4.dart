import 'package:flutter/material.dart';

class PagInicio4 extends StatefulWidget {
  const PagInicio4({Key? key}) : super(key: key);

  @override
  State<PagInicio4> createState() => _PagInicio4State();
}

class _PagInicio4State extends State<PagInicio4> {
  void _select(String choice) {
    // Aquí puedes manejar las acciones como 'Borrar grupo', etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return {'Borrar grupo'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(),
          Container(),
        ],
      ),
    );
  }
}

Widget grupo(String nombre_grupo, VoidCallback onPressed) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(nombre_grupo),
    ),
  );
}
