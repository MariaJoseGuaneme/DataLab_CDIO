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

  void _borrarGrupo() {
    if (grupos.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmar'),
            content: const Text('¿Quieres borrar el último grupo?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                },
              ),
              TextButton(
                child: const Text('Borrar'),
                onPressed: () {
                  setState(() {
                    grupos.removeLast();
                  });
                  Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                },
              ),
            ],
          );
        },
      );
    }
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
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'Borrar grupo') {
                _borrarGrupo();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Borrar grupo',
                child: Text('Borrar grupo'),
              ),
            ],
          ),
        ],
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
                return _grupo(grupos[index], Icons.check, () {}, () {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Rechazar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Aceptar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _grupo(String nombre_grupo, IconData iconData, VoidCallback onPressed, VoidCallback onIconPressed) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text(nombre_grupo),
        trailing: IconButton(
          icon: Icon(iconData),
          onPressed: onIconPressed,
        ),
        onTap: onPressed,
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