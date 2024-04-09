import 'package:flutter/material.dart';
import 'menuinferior.dart'; // Importando o arquivo menuinferior.dart
import 'cadastroinvestimento.dart'; // Importando o arquivo correspondente
import 'cadastrolembrete.dart'; // Importando o arquivo correspondente
import 'cadastrometafinanceira.dart'; // Importando o arquivo correspondente
import 'cadastropagamento.dart'; // Importando o arquivo correspondente
import 'cadastrorecebimento.dart'; // Importando o arquivo correspondente
import 'educacaofinanceira.dart'; // Importando o arquivo correspondente
import 'estatisticas.dart'; // Importando o arquivo correspondente
import 'inicio.dart'; // Importando o arquivo correspondente
import 'investimentos.dart'; // Importando o arquivo correspondente
import 'lembretes.dart'; // Importando o arquivo correspondente
import 'transacoes.dart'; // Importando o arquivo correspondente

void main() {
  runApp(const MenuScreen());
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          backgroundColor: Colors.grey[800],
        ),
        body: Container(
          color: Colors.grey[300],
          child: Center(
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Menu:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(
                          title: 'Cadastro de Investimento',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CadastroInvestimentoScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Cadastro de Lembrete',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CadastroLembreteScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Cadastro de Meta Financeira',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CadastroMetaFinanceiraScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Cadastro de Pagamento',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CadastroPagamentoScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Cadastro de Recebimento',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CadastroRecebimentoScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Educação Financeira',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EducacaoFinanceiraScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Estatísticas',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EstatisticasScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Início',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FinanceApp(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Investimentos',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InvestimentosScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Lembretes',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LembretesScreen(),
                              ),
                            );
                          },
                        ),
                        MenuItem(
                          title: 'Transações',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransacoesScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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

class MenuItem extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const MenuItem({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.navigate_next),
      title: Text(title),
      onTap: onPressed,
    );
  }
}
