import 'package:base/paginas/vista_profes/p_5.dart';
import 'package:base/paginas/vista_profes/p_6.dart';
import 'package:flutter/material.dart';

class PagInicio4 extends StatefulWidget {
  const PagInicio4({Key? key}) : super(key: key);

  @override
  _PagInicio4State createState() => _PagInicio4State();
}

class _PagInicio4State extends State<PagInicio4> {
  List<String> grupos = ['Grupo 1', 'Grupo 2'];

  void _agregarGrupo() {
    setState(() {
      grupos.add('Grupo ${grupos.length + 1}');
    });
  }

  void _borrarGrupo(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: Text('¿Estás seguro de que quieres borrar "${grupos[index]}"?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Borrar'),
              onPressed: () {
                setState(() {
                  grupos.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GRUPOS ACTUALES'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: grupos.length + 1, // +1 para el botón de agregar grupo
              itemBuilder: (context, index) {
                if (index == grupos.length) {
                  return _crearBotonAgregar();
                }
                return _grupo(grupos[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _grupo(String nombre_grupo, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(nombre_grupo),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Acción para editar el grupo
              },
            ),
            PopupMenuButton<String>(
              onSelected: (String result) {
                if (result == 'Borrar') {
                  _borrarGrupo(index);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Borrar',
                  child: Text('Borrar'),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          // Aquí puedes definir la acción al tocar el grupo si es necesario
        },
      ),
    );
  }

  Widget _crearBotonAgregar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: OutlinedButton.icon(
        icon: const Icon(Icons.add),
        label: const Text('Agregar grupo'),
        onPressed: _agregarGrupo,
      ),
    );
  }
}