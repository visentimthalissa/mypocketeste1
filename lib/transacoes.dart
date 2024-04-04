import 'package:flutter/material.dart';
import 'menuinferior.dart'; // Importando o arquivo menuinferior.dart

void main() => runApp(TransacoesScreen());

class TransacoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.grey[300], // Define o fundo da tela como cinza claro
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white, // Define o fundo do retângulo como branco
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Transações:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // Adiciona um espaço vertical
                TransactionItem(
                  transactionName: 'Transação 1',
                  transactionDescription:
                      'Descrição e informações da transação aqui.',
                  value: '+R\$12.388,044',
                  date: 'Realizada no dia 03/02',
                ),
                TransactionItem(
                  transactionName: 'Transação 2',
                  transactionDescription:
                      'Descrição e informações da transação aqui.',
                  value: '-R\$8.500,000',
                  date: 'Realizada no dia 03/02',
                ),
                TransactionItem(
                  transactionName: 'Transação 3',
                  transactionDescription:
                      'Descrição e informações da transação aqui.',
                  value: '+R\$5.230,100',
                  date: 'Realizada no dia 03/02',
                ),
                TransactionItem(
                  transactionName: 'Transação 4',
                  transactionDescription:
                      'Descrição e informações da transação aqui.',
                  value: '-R\$20.388,200',
                  date: 'Realizada no dia 03/02',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomMenu(), // Adicionando o menu inferior
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String transactionName;
  final String transactionDescription;
  final String value;
  final String date;

  const TransactionItem({
    Key? key,
    required this.transactionName,
    required this.transactionDescription,
    required this.value,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transactionName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  transactionDescription,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: value.startsWith('+')
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.yellow[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
