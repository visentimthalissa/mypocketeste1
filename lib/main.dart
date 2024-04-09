import 'package:flutter/material.dart';
import 'login.dart'; // Importe o arquivo login.dart aqui

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: LoginScreen(), // Defina LoginScreen como a primeira tela
    );
  }
}
