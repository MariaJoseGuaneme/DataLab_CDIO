import 'package:base/paginas/vista_profes/p_3a.dart';
import 'package:flutter/material.dart';
import 'package:base/base_datos_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PagInicio3b extends StatefulWidget {
  const PagInicio3b({Key? key}) : super(key: key);

  @override
  State<PagInicio3b> createState() => _PagInicio3bState();
}

class _PagInicio3bState extends State<PagInicio3b> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final DatabaseManager _dbManager = DatabaseManager(); //instancia del manager

  bool _obscureText = true;
  bool _obscureText2 = true;


  @override
  void dispose() {
  // Es importante limpiar los controladores cuando el widget sea desmontado.
  emailController.dispose();
  passwordController.dispose();
  confirmPasswordController.dispose();
  super.dispose();
  }

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
          padding:  EdgeInsets.symmetric(
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
              SizedBox(height: 48.0.h),
              Text(
                'INGRESA TUS DATOS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 48.0.h),
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
                    SizedBox(height: 50.0.h),
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
                    SizedBox(height: 50.0.h),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: _obscureText2,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: 'Confirmar Contraseña',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0.h, horizontal: 20.0.w),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText2
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 200.0.w),
                child: Container(
                  child: Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        // Obtener los valores de los TextFields.
                        final email = emailController.text.trim();  // Asegúrate de inicializar un TextEditingController para los campos
                        final password = passwordController.text;
                        final confirmPassword = confirmPasswordController.text;

                        // Validar que los campos no están vacíos y que la contraseña y confirmar contraseña son iguales.
                        if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Por favor, rellena todos los campos')),
                          );
                          return;
                        }

                        if (password != confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Las contraseñas no coinciden')),
                          );
                          return;
                        }

                        // Intentar registrar al profesor.
                        try {
                          await _dbManager.insertProfesor(email, password, context);
                          // Navegar a la pantalla de inicio después de registrar
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => const PagInicio3a()), // Asegúrate de tener esta página o ajustar según corresponda
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error al registrar: ${e.toString()}')),
                          );
                        }
                      },
                      minWidth: 100.0.w,
                      height: 42.0.h,
                      child: Text(
                        'Crear Cuenta',
                        style: TextStyle(color: Colors.white, fontSize: 17.0.sp),
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
