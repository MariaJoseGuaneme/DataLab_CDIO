import 'package:base/paginas/vista_profes/p_6.dart';
import 'package:base/paginas/vista_profes/p_9.dart';
import 'package:flutter/material.dart';

class Select_p extends StatefulWidget {
  const Select_p({super.key});

  @override
  State<Select_p> createState() => _Select_p();
}

class _Select_p extends State<Select_p> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Goes back to the previous page.
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: inicio(context),
    );
  }
}

Widget inicio(BuildContext context) {
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
              'Selecciona la actividad',
              style: TextStyle(
                color: Colors.black,
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
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PagInicio9()),
                );
                // Handle INSERTAR DATOS tap
              },
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 135, 213),
                  border: Border.all(
                      color: const Color.fromARGB(255, 68, 100, 165),
                      width: 10),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'INSERTAR DATOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 60),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PagInicio6()),
                );
              },
              child: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 85, 223, 138),
                  border: Border.all(
                      color: const Color.fromARGB(255, 104, 203, 102),
                      width: 10),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'REVISAR PRACTICAS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
