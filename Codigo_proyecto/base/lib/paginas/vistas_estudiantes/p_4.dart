import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PagInicio4(), // Set PagInicio4 as the home widget of the app.
    );
  }
}

// PagInicio4 is a StatefulWidget which will show the UI defined in inicio().
class PagInicio4 extends StatefulWidget {
  const PagInicio4({super.key});

  @override
  State<PagInicio4> createState() => _PagInicio4State();
}

class _PagInicio4State extends State<PagInicio4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: inicio(),
    );
  }
}

// inicio defines the UI that the PagInicio4 will show.
Widget inicio() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 400,
          width: 400,
          child: Image.asset('assets/logou.jpg'),
        ),
        const SizedBox(height: 30.0),
        Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(color: Colors.green, width: 4.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Center(
            child: Text(
              'Seleccionar actividad',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 50.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 89, 135, 213),
                border: Border.all(
                    color: const Color.fromARGB(255, 68, 100, 165), width: 10),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  'Revisar práctica',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 60),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 85, 223, 138),
                border: Border.all(
                    color: const Color.fromARGB(255, 79, 199, 76), width: 10),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  'Seleccionar práctica',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
