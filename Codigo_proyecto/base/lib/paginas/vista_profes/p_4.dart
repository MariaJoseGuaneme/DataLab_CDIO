import 'package:base/paginas/p_2.dart';
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
        title: Text('Grupos actuales', style: TextStyle(fontSize: 32.sp)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),),
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            onTap: showHelpDialog,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ayuda', style: TextStyle(fontSize: 26.sp)),
                SizedBox(width: 4.w),
                Icon(Icons.help_outline, size: 46.sp),
        ],
      ),
        ),
      ]
      ),
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/UQ.png',
            width: 200.w,
            height: 200.h,
          ),
          SizedBox(height: 10.h),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 100.0.w),
          child:
          Text('Selecciona el grupo al que quieres \n         configurar una práctica', style: TextStyle(fontSize: 30.sp)),
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PagInicio2()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              fixedSize: Size(320.w, 50.h),
            ),
            child: const Text('Inicio'),
          ),
          SizedBox(height: 50.h),
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
  void showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ayuda:'),
          content: Text('En esta sección podrás añadir, editar y borrar grupos, además de acceder a la configuración de las prácticas de un grupo en particular\n\n 1. Añadir correos de estudiantes: Click en el ícono de editar \n 2. Eliminar un grupo: Click en los tres puntos al lado del grupo y borrarlo \n 3. Abrir la página de configuración de prácticas: Click en el grupo al que quieres configurar las prácticas '),
          actions: <Widget>[
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                side: BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ],
        );
      },
    );
  }
}
