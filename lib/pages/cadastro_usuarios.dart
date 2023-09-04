import 'package:cadastros/model/usuario.dart';
import 'package:cadastros/model/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Usuarios extends StatefulWidget {
  const Usuarios({super.key});

  @override
  State<Usuarios> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<Usuarios> {
  final campoNome = TextEditingController(),
      campoSenha = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  UsuarioRepository userRepo = new UsuarioRepository();
  final FocusNode focoNome = FocusNode();

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset('assets/images/cadastro.jpg'),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: this._formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: campoNome,
                        keyboardType: TextInputType.name,
                        focusNode: focoNome,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.blue.shade200,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "O nome não pode ser vazio";
                          } else {
                            if (campoNome.text.length < 3) {
                              return "O nome deve ter mais que 3 digitos";
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: campoSenha,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.blue.shade200,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "A senha não pode ser vazio";
                          } else {
                            if (campoSenha.text.length < 6) {
                              return "A senha deve ter mais que 6 digitos";
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                String nome = campoNome.text;
                                String senha = campoSenha.text;
                                
                                Usuario user = new Usuario(senha: senha, nome: nome);

                                userRepo.adicionar(user);
                                userRepo.imprimir();
                                limpaCampos();
                                mostraMsgSucesso();
                                setState(() {});
                              }
                            },
                            child: Text(
                              'Cadastrar',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              limpaCampos();
                              _formKey.currentState!.reset();
                              setState(() {});
                            },
                            child: Text(
                              'Limpar',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuarios'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  void limpaCampos() {
    campoNome.clear();
    campoSenha.clear();
    focoNome.requestFocus();
  }

  void mostraMsgSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Produto cadastrado com sucesso'))
    );
  }
}
