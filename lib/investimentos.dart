import 'package:flutter/material.dart';
import 'menuinferior.dart'; // Importando o arquivo menuinferior.dart

void main() => runApp(const InvestimentosScreen());

class InvestimentosScreen extends StatelessWidget {
  const InvestimentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            Colors.grey[300], // Define o fundo da tela como cinza claro
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white, // Define o fundo do retângulo como branco
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Investimentos:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Adiciona um espaço vertical
                  InvestmentItem(
                    investmentName: 'Investimento 1',
                    investmentDescription:
                        'Descrição e informações do investimento aqui.',
                    value: 'R\$12.388,044',
                    yearlyReturn: '11,25% no último ano',
                  ),
                  InvestmentItem(
                    investmentName: 'Investimento 2',
                    investmentDescription:
                        'Descrição e informações do investimento aqui.',
                    value: 'R\$8.500,000',
                    yearlyReturn: '9,75% no último ano',
                  ),
                  InvestmentItem(
                    investmentName: 'Investimento 3',
                    investmentDescription:
                        'Descrição e informações do investimento aqui.',
                    value: 'R\$5.230,100',
                    yearlyReturn: '10,50% no último ano',
                  ),
                  InvestmentItem(
                    investmentName: 'Investimento 4',
                    investmentDescription:
                        'Descrição e informações do investimento aqui.',
                    value: 'R\$20.388,200',
                    yearlyReturn: '12,00% no último ano',
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomMenu(), // Adicionando o menu inferior
      ),
    );
  }
}

class InvestmentItem extends StatelessWidget {
  final String investmentName;
  final String investmentDescription;
  final String value;
  final String yearlyReturn;

  const InvestmentItem({
    Key? key,
    required this.investmentName,
    required this.investmentDescription,
    required this.value,
    required this.yearlyReturn,
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
                  investmentName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  investmentDescription,
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                yearlyReturn,
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
