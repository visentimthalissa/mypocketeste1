import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'menuinferior.dart';

void main() {
  runApp(const CadastroUsuarioScreen());
}

class CadastroUsuarioScreen extends StatefulWidget {
  const CadastroUsuarioScreen({Key? key}) : super(key: key);

  @override
  _CadastroUsuarioScreenState createState() => _CadastroUsuarioScreenState();
}

class _CadastroUsuarioScreenState extends State<CadastroUsuarioScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  bool senhasIguais = true;

  void formatDate(String value) {
    String formattedValue = '';
    if (value.length <= 2) {
      formattedValue = value;
    } else if (value.length <= 4) {
      formattedValue = '${value.substring(0, 2)}/${value.substring(2)}';
    } else if (value.length <= 6) {
      formattedValue =
          '${value.substring(0, 2)}/${value.substring(2, 4)}/${value.substring(4)}';
    } else {
      formattedValue =
          '${value.substring(0, 2)}/${value.substring(2, 4)}/${value.substring(4)}';
    }
    dataNascimentoController.value = TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }

  void validatePasswords(String value) {
    setState(() {
      senhasIguais = senhaController.text == value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 208, 0),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome Completo',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: senhaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: confirmarSenhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirme sua senha',
                      fillColor: Colors.white,
                      filled: true,
                      errorText:
                          senhasIguais ? null : 'As senhas não são iguais',
                    ),
                    onChanged: validatePasswords,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: dataNascimentoController,
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(8),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Data de nascimento (dd/mm/aaaa)',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onChanged: formatDate,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: enderecoController,
                    decoration: const InputDecoration(
                      labelText: 'Endereço',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: telefoneController,
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Criar Conta'),
                  ),
                  const SizedBox(height: 10),
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
