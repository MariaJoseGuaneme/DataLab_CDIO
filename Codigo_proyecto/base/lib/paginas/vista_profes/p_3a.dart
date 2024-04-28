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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'assets/UQ.png', // Debes añadir el logo en tu carpeta de assets.
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
                padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 8.0),
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
              SizedBox(height: 24.0),
              Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    // Implementar la lógica de inicio de sesión
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  // Implementar lógica para ir a la pantalla de registro
                },
                child: Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.green, fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}