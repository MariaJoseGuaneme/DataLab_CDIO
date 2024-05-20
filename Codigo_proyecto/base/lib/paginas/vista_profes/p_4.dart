import 'package:base/paginas/vista_profes/p_16.dart';
import 'package:base/funciones_proyecto/select_actividad_profe.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base_datos.dart';
import '../../preferences.dart';


class PagInicio4 extends StatefulWidget {
  const PagInicio4({Key? key}) : super(key: key);

  @override
  _PagInicio4State createState() => _PagInicio4State();
}

class _PagInicio4State extends State<PagInicio4> {
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  List<Grupo> grupos = [];
  int idProfesor = UserPreferences.getIdProfesor();

  Future<void> _cargarGrupos(int idProfesor) async {// Asumiendo que se obtiene de alguna manera
    grupos = await _databaseH.getGruposPorProfesor(idProfesor);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _cargarGrupos(idProfesor);  // Cargar los grupos al inicializar
    //_databaseH.deleteAllGruposAndResetAutoincrement(); //Lo mismo NO DESCOMENTAR
    //_databaseH.deleteAllEstudiantesAndResetAutoincrement(); //Solo lo borramos nosotros en caso de necesitarlo, NO DESCOMENTAR, gracias
  }

  void _agregarGrupo(int idProfesor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController groupNameController = TextEditingController();
        return AlertDialog(
          title: Text('Nuevo Grupo'),
          content: TextField(
            controller: groupNameController,
            decoration: InputDecoration(hintText: "Nombre del Grupo"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Agregar'),
              onPressed: () async {
                Navigator.of(context).pop();
                 await _databaseH.insertGrupo(groupNameController.text, idProfesor);
                _cargarGrupos(idProfesor);
                // Aquí podrías pasar idGrupo a la siguiente página si es necesario
              },
            ),
          ],
        );
      },
    );
  }

  void _borrarGrupo(int index) {
    int idGrupo = grupos[index].id!;  // Asegúrate de que el grupo tiene un ID
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content: Text('¿Estás seguro de que quieres borrar este grupo?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Borrar'),
              onPressed: () async {
                Navigator.of(context).pop();
                await _databaseH.deleteGrupo(idGrupo);
                _cargarGrupos(idProfesor);
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
          Image.asset(
            'assets/UQ.png',
            width: 200.w,
            height: 200.h,
          ),
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

  Widget _grupo(Grupo grupo, int index) {
    return Card(
      margin:  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
      child: ListTile(
        title: Text(grupo.nombre),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                UserPreferences.setIdGrupo(grupos[index].id!);  // Actualiza el id_grupo en SharedPreferences
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PagInicio16()),
                ); // Acción para editar el grupo
              },
            ),
            PopupMenuButton<String>(
              onSelected: (String result) {
                UserPreferences.setIdGrupo(grupos[index].id!);
                if (result == 'Borrar') {
                  _borrarGrupo(index);
                  _cargarGrupos(idProfesor);
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
        onTap: () async {
          await UserPreferences.setIdGrupo(grupo.id!); // Guarda el id_grupo antes de la navegación
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Select_p()),
          ); // Navega a Select_p
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
        onPressed: () {
          int idProfesor = UserPreferences.getIdProfesor(); // Asume que tienes el ID del profesor guardado o pasarlo como argumento a esta función
          _agregarGrupo(idProfesor);
        },
      ),
    );
  }
}
