import 'package:flutter/material.dart';

void main() {
  runApp(FinanceApp());
}

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinanceScreen(),
    );
  }
}

class FinanceScreen extends StatefulWidget {
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
  String _patrimonio = 'R\$ 10.000,00';

  @override
  Widget build(BuildContext context) {
    Color background = Colors.white; // Cor de fundo dos retângulos
    Color darkerBackground =
        Color.fromRGBO(250, 250, 250, 1.0); // Cor de fundo 10% mais escura

    return Scaffold(
      appBar: AppBar(
        title: Text('Finanças Pessoais'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Container(
          color: darkerBackground,
          padding: EdgeInsets.all(20.0),
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
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile_picture.jpg'),
                      radius: 50.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      _nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      color: background,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Seu patrimônio atual é de:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  _patrimonio,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
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
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEditableField('Nome', _nome),
                    _buildEditableField('Telefone', _telefone),
                    _buildEditableField('Email', _email),
                    _buildEditableField('Data de Nascimento', _dataNascimento),
                    _buildEditableField('Endereço', _endereco),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
              style: TextStyle(fontSize: 16.0),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditDialog(label, value);
              },
            ),
          ],
        ),
        SizedBox(height: 5.0),
        Text(
          value,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 10.0),
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
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
