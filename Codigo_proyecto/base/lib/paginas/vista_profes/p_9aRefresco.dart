import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/base_datos.dart';
import 'package:base/paginas/vista_profes/p_10.dart';

class PagInicio9aRefresco extends StatefulWidget {
  const PagInicio9aRefresco({super.key});

  @override
  _PagInicio9aRefrescoState createState() => _PagInicio9aRefrescoState();
}

class _PagInicio9aRefrescoState extends State<PagInicio9aRefresco> {
  final TextEditingController _frutaController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  String practica = 'practica1';
  int idGrupo = 1;

  @override
  void initState() {
    super.initState();
    _cargarPesoInicial();
  }


  void _cargarPesoInicial() async {
    final String fruta = await _databaseH.getTextValue(practica,'fruta', idGrupo);
    setState(() {
      _frutaController.text = fruta == 'Na'? "": fruta.toString();
    });
  }


  void _guardarFruta() async {
    final String fruta = _frutaController.text;
    await _dbManager.insertSingleDataPractica1('fruta', fruta, idGrupo, context);//Acá toca cambiar el 1 por un 2 cuando se cree la otra funciín
  }

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
                        'Ingresar fruta',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'Ingrese el nombre de la fruta',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _frutaController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fruta',
                        hintText: 'Introduzca el nombre de la fruta',
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    ElevatedButton(
                      onPressed: (){
                        _guardarFruta();
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context) => const PagInicio10() ));
                      },
                      //onPressed: _guardarFruta,
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
    )
    ]
      )
    );
  }
}


