
import 'package:base/funciones_proyecto/select_actividad_estudiante.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos_manager.dart';
import 'package:base/paginas/vistas_estudiantes/p_4.dart';

class PagInicio3e extends StatefulWidget {
  const PagInicio3e({Key? key}) : super(key: key);

  @override
  State<PagInicio3e> createState() => _PagInicio3eState();
}

class _PagInicio3eState extends State<PagInicio3e> {
  final TextEditingController emailController = TextEditingController();
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 50.0), // Asegúrate de usar 'const' para optimizar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'assets/UQ.png', // Asegúrate de que el logo está en tu carpeta de assets.
                  height: 140.0,
                ),
              ),
              SizedBox(height: 48.0),
              Text(
                'INGRESA TU CORREO',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 48.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 60.0,
                    horizontal:
                    8.0), // Asegúrate de usar 'const' para optimizar
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_sharp),
                        hintText: 'Correo institucional',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50.0),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200.0),
                child: Container(
                  child: Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        final email = emailController.text.trim();
                        if (email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Por favor, rellena el campo')),
                          );
                          return;
                        }

                        // Verificar las credenciales.
                        var estudiante = await _dbManager.getEstudianteByEmail(email);
                        if (estudiante != null ) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const Select_e()), // Ajusta esta línea según corresponda
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Correo no registrado')),
                          );
                        }
                      },
                      minWidth: 100.0,
                      height: 42.0,
                      child: Text(
                        'Ingresar',
                        style: TextStyle(color: Colors.white, fontSize: 17.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
