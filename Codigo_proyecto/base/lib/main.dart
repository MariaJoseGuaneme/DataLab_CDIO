import 'package:base/preferences.dart';
import 'package:flutter/material.dart';
import 'package:base/funciones_proyecto/inicio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';  // Importa flutter_screenutil

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(768, 1024),  // Tamaño de diseño original para tablet
      minTextAdapt: true,  // Ajusta el tamaño del texto para que se adapte también
      builder: (context, child) => MaterialApp(
        home: const PagInicio(),
      ),
    );
  }
}
