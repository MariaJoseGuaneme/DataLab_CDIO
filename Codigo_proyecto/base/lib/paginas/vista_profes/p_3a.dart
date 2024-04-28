import 'package:flutter/material.dart';

class PagInicio3a extends StatefulWidget {
  const PagInicio3a({Key? key}) : super(key: key);

  @override
  State<PagInicio3a> createState() => _PagInicio3aState();
}

class _PagInicio3aState extends State<PagInicio3a> {
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
          padding: const EdgeInsets.symmetric(horizontal: 50.0), // Asegúrate de usar 'const' para optimizar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'assets/UQ.png', // Asegúrate de que el logo está en tu carpeta de assets.
                  height: 120.0,
                ),
              ),
              SizedBox(height: 48.0),
              Text(
                'INGRESA TUS DATOS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 48.0),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 8.0), // Asegúrate de usar 'const' para optimizar
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_sharp),
                        hintText: 'Correo institucional',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: 'Contraseña',
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
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
                      onPressed: () {
                        // Implementar la lógica de inicio de sesión
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
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200),
                child: Container(
                  width: 100.0,
                  child: Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        // Implementar la lógica de inicio de sesión
                      },
                      minWidth: 50.0,
                      height: 42.0,
                      child: Text(
                        'Registrase',
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
