import 'package:cadastros/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'pages/cadastro_produtos.dart';
import 'pages/cadastro_usuarios.dart';

void main() {
  runApp(ExeCadastro());
}

class ExeCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/produtos': (context) => Produtos(),
        '/usuarios': (context) => Usuarios(),
      },
    );
  }
}
