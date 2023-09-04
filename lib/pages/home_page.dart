import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                child: Image.asset('assets/images/sonic.jpeg')),
              accountName: Text("Gustavo dos Santos Vitali Macedo"),
              accountEmail: Text("cl202002@g.unicamp.br"),
            ),
            ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('Produtos'),
              subtitle: Text('Cadastro de produtos'),
              onTap: () {
                Navigator.of(context).pushNamed('/produtos');
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle_outlined),
              title: Text('Clientes'),
              subtitle: Text('Cadastro de clientes'),
              onTap: () {
                Navigator.of(context).pushNamed('/usuarios');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Salve Tânia'),
        centerTitle: true,
      ),
      body: Center(
          child: Text('Salve Salve prof'),
        ),
    );
  }

}