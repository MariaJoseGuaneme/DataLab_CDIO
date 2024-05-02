import 'package:flutter/material.dart';

class PagInicio16 extends StatefulWidget {
  const PagInicio16({Key? key}) : super(key: key);

  @override
  _PagInicio16State createState() => _PagInicio16State();
}

class _PagInicio16State extends State<PagInicio16> {
  List<String> correos = [
    'ejemplo1@uqvirtual.edu.co',
    'ejemplo2@uqvirtual.edu.co',
    'ejemplo3@uqvirtual.edu.co',
  ];

  final TextEditingController _emailController = TextEditingController();

  void _agregarCorreo() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        correos.add(_emailController.text);
        _emailController.clear();
      });
    }
  }

  void _borrarCorreo(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: Text('¿Estás seguro de que quieres borrar "${correos[index]}"?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Borrar'),
              onPressed: () {
                setState(() {
                  correos.removeAt(index);
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
        title: Text('Correos en este grupo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 21, 110, 34),
            width: double.infinity,
            child: const Text(
              'Agregar nuevo correo institucional',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_add_alt_1),
                hintText: "Correo electrónico",
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _agregarCorreo,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: correos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.email),
                  title: Text(correos[index]),
                  trailing: PopupMenuButton<String>(
                    onSelected: (String result) {
                      if (result == 'Borrar') {
                        _borrarCorreo(index);
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Borrar',
                        child: Text('Borrar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
