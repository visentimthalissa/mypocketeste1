import 'package:flutter/material.dart';
import 'menuinferior.dart'; // Importando o arquivo menuinferior.dart

void main() {
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinanceScreen(),
    );
  }
}

class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  // Variáveis para armazenar os dados do usuário
  String _nome = 'João da Silva';
  String _telefone = '(11) 1234-5678';
  String _email = 'joao@example.com';
  String _dataNascimento = '01/01/1990';
  String _endereco = 'Rua Exemplo, 123 - Bairro - Cidade';
  final String _patrimonio = 'R\$ 10.000,00';

  @override
  Widget build(BuildContext context) {
    Color background = Colors.white; // Cor de fundo dos retângulos
    Color darkerBackground =
        const Color.fromRGBO(250, 250, 250, 1.0); // Cor de fundo 10% mais escura

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            color: darkerBackground,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/profile_picture.jpg'),
                        radius: 50.0,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        _nome,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        color: background,
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Seu patrimônio atual é de:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    _patrimonio,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEditableField('Nome', _nome),
                      _buildEditableField('Telefone', _telefone),
                      _buildEditableField('Email', _email),
                      _buildEditableField(
                          'Data de Nascimento', _dataNascimento),
                      _buildEditableField('Endereço', _endereco),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(), // Adicionando o menu inferior
    );
  }

  Widget _buildEditableField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 16.0),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                _showEditDialog(label, value);
              },
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Text(
          value,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  void _showEditDialog(String label, String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar $label'),
          content: TextField(
            controller: TextEditingController(text: value),
            onChanged: (newValue) {
              setState(() {
                if (label == 'Nome') {
                  _nome = newValue;
                } else if (label == 'Telefone') {
                  _telefone = newValue;
                } else if (label == 'Email') {
                  _email = newValue;
                } else if (label == 'Data de Nascimento') {
                  _dataNascimento = newValue;
                } else if (label == 'Endereço') {
                  _endereco = newValue;
                }
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
