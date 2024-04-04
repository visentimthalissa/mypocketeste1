import 'package:flutter/material.dart';
import 'cadastrousuario.dart'; // Importe o arquivo cadastrousuario.dart
import 'inicio.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fundo.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        height:
                            110.0), // Adiciona um espaço entre o topo e os campos de texto
                    Container(
                      color: Colors.white.withOpacity(
                          1.0), // Fundo branco com 100% de opacidade
                      child: TextField(
                        style: TextStyle(
                            fontSize: 16.0), // Define o tamanho da fonte
                        decoration: InputDecoration(
                          hintText: 'Usuário',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                        height:
                            10.0), // Adiciona um espaço entre os campos de texto
                    Container(
                      color: Colors.white.withOpacity(
                          1.0), // Fundo branco com 100% de opacidade
                      child: TextField(
                        style: TextStyle(
                            fontSize: 16.0), // Define o tamanho da fonte
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Implementar ação para "Esqueci minha senha"
                          },
                          child: Text(
                            'Esqueci minha senha',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CadastroUsuarioScreen()),
                            );
                          },
                          child: Text(
                            'Criar conta',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height:
                            20.0), // Adiciona um espaço entre os botões e o botão "Entrar"
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              90), // Define o tamanho horizontal do contêiner preto
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FinanceApp()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.black.withOpacity(
                                  0.8)), // Fundo preto com 80% de opacidade
                        ),
                        child: Text(
                          'Entrar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
