import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

Future<String> loadData() async {
  // Simula una operación de carga con un delay
  await Future.delayed(const Duration(seconds: 3));
  return 'Data Loaded';
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<String>(
        future: loadData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Hello World!'),
              ),
            );
          }
        },
      ),
    );
  }
}