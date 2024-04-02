import 'package:flutter/material.dart';

void main() {
  runApp(MenuScreen());
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
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
                  Text(
                    'Menu:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(title: 'Cadastro de Investimento'),
                        MenuItem(title: 'Cadastro 1'),
                        MenuItem(title: 'Cadastro 2'),
                        MenuItem(title: 'Cadastro 3'),
                        MenuItem(title: 'Cadastro 4'),
                        MenuItem(title: 'Cadastro 5'),
                        MenuItem(title: 'Cadastro 6'),
                        MenuItem(title: 'Cadastro 7'),
                        MenuItem(title: 'Cadastro 8'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  MenuItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.navigate_next),
      title: Text(title),
      onTap: () {
        // Add your navigation logic here
      },
    );
  }
}
