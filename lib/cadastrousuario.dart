import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _dateController = TextEditingController();

    // This function formats the input text as dd/mm/yyyy
    void _formatDate(String value) {
      String formattedValue = '';
      if (value.length <= 2) {
        formattedValue = value;
      } else if (value.length <= 4) {
        formattedValue = value.substring(0, 2) + '/' + value.substring(2);
      } else if (value.length <= 6) {
        formattedValue = value.substring(0, 2) +
            '/' +
            value.substring(2, 4) +
            '/' +
            value.substring(4);
      } else {
        formattedValue = value.substring(0, 2) +
            '/' +
            value.substring(2, 4) +
            '/' +
            value.substring(4, 8);
      }
      _dateController.value = TextEditingValue(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 208, 0),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirme sua senha',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _dateController,
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(8),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Data de nascimento (dd/mm/aaaa)',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  onChanged: _formatDate,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para criar a conta
                  },
                  child: Text('Criar Conta'),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Lógica para voltar para a tela de login
                  },
                  child: Text(
                    'Voltar para tela de login',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
