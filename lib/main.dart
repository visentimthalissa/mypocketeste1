import 'package:flutter/material.dart';
import 'login.dart'; // Importe o arquivo login.dart aqui

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: LoginScreen(), // Defina LoginScreen como a primeira tela
    );
  }
}
