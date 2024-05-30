import 'package:base/paginas/vista_profes/p_3b.dart';
import 'package:base/paginas/vista_profes/p_4.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../preferences.dart';

class PagInicio3a extends StatefulWidget {
  const PagInicio3a({Key? key}) : super(key: key);

  @override
  State<PagInicio3a> createState() => _PagInicio3aState();
}

class _PagInicio3aState extends State<PagInicio3a> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseHelper _databaseH = DatabaseHelper.instance; //instancia de la base de datos
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión - Profesor', style: TextStyle(fontSize: 30.sp)),
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
          padding: EdgeInsets.symmetric(
              horizontal: 50.0.w), // Asegúrate de usar 'const' para optimizar
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'assets/UQ.png', // Asegúrate de que el logo está en tu carpeta de assets.
                  height: 120.0.h,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'INGRESA TUS DATOS \n PARA INICIAR SESIÓN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26.0.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30.0.h),
              Container(
                padding:  EdgeInsets.symmetric(
                    vertical: 60.0.h,
                    horizontal:
                        8.0.w), // Asegúrate de usar 'const' para optimizar
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
                            vertical: 10.0.h, horizontal: 20.0.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    TextField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: 'Contraseña',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0.h, horizontal: 20.0.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 200.0.w),
                child: Container(
                  child: Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        final email = emailController.text.trim();
                        final password = passwordController.text;

                        if (email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Por favor, rellena todos los campos')),
                          );
                          return;
                        }

                        // Verificar las credenciales.
                        var profesor = await _databaseH.getProfesorByEmail(email);
                        if (profesor != null && profesor.contrasena == password) {
                          await UserPreferences.setIdProfesor(profesor.id!); // Asegúrate de que el ID está disponible
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const PagInicio4()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Credenciales incorrectas')),
                          );
                        }

                      },
                      minWidth: 100.0.w,
                      height: 42.0.h,
                      child: Text(
                        'Ingresar',
                        style: TextStyle(color: Colors.white, fontSize: 24.0.sp),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0.h),
              Padding(padding: EdgeInsets.symmetric(horizontal: 150.w),child:Text('Si no tienes una cuenta, regístrate', style: TextStyle(fontSize: 20.sp))),
              SizedBox(height: 10.0.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 200.w),
                child: Container(
                  width: 100.0.w,
                  child: Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PagInicio3b()),);// Implementar la lógica de Registrarse
                      },
                      minWidth: 50.0.w,
                      height: 42.0.h,
                      child: Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.white, fontSize: 24.0.sp),
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
