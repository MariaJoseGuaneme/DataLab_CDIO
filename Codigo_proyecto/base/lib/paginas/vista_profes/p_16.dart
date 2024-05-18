import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../preferences.dart';

class PagInicio16 extends StatefulWidget {
  const PagInicio16({super.key});

  @override
  _PagInicio16State createState() => _PagInicio16State();
}

class _PagInicio16State extends State<PagInicio16> {
  final DatabaseHelper _databaseH = DatabaseHelper.instance;
  List<Estudiante> estudiantes = [];  // Lista de objetos Estudiante
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarCorreos();
  }

  Future<void> _cargarCorreos() async {
    int idGrupo = UserPreferences.getIdGrupo();
    estudiantes = await _databaseH.getEstudiantesPorGrupo(idGrupo);
    setState(() {});
  }

  void _borrarCorreo(int index) {
    UserPreferences.setIdGrupo(estudiantes[index].idGrupos);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: const Text('¿Estás seguro de que quieres borrar este correo?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Borrar'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _databaseH.deleteEstudiante(estudiantes[index].id!);
                _cargarCorreos();
              },
            ),
          ],
        );
      },
    );
  }

  void _agregarCorreo() async {
    if (_emailController.text.isNotEmpty) {
      int idGrupo = UserPreferences.getIdGrupo();  // Usar el idGrupo actual de SharedPreferences
      Estudiante nuevoEstudiante = Estudiante(
        idGrupos: idGrupo,
        correo: _emailController.text.trim(),
      );
      await _databaseH.insertEstudiante(nuevoEstudiante);
      _emailController.clear();
      _cargarCorreos();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, introduce un correo")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Correos en este grupo'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromARGB(255, 21, 110, 34),
            width: double.infinity,
            child: Text(
              'Agregar nuevo correo institucional',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
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
                prefixIcon: const Icon(Icons.person_add_alt_1),
                hintText: "Correo electrónico",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _agregarCorreo,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: estudiantes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(estudiantes[index].correo),
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
