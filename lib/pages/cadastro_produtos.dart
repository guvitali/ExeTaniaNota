import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/produto.dart';
import '../model/produtos_repository.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<Produtos> {
  final campoCodigo = TextEditingController(),
      campoDescricao = TextEditingController(),
      campoPreco = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ProdutoRepository prodRepo = new ProdutoRepository();
  final FocusNode focoCodigo = FocusNode();

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
                        controller: campoCodigo,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        focusNode: focoCodigo,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          labelText: 'Código',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.blue.shade200,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "O Código não pode ser vazio";
                          } else {
                            if (campoCodigo.text.length < 3 ||
                                campoCodigo.text.length > 5) {
                              return "O código deve ter mais que 3 digitos e menos que 5";
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: campoDescricao,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.blue.shade200,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "A descrição não pode ser vazio";
                          } else {
                            if (campoDescricao.text.length < 6) {
                              return "A descrição deve ter mais que 6 digitos";
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: campoPreco,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          labelText: 'Preço',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.blue.shade200,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "O preço não pode ser vazio";
                          } else {
                            if (double.parse(value) < 1) {
                              return "O preço não pode ser negativo ou menor que 1 real.";
                            }
                          }
                          return null;
                        },
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
                                int codigo = int.parse(campoCodigo.text);
                                String descricao = campoDescricao.text;
                                double preco = double.parse(campoPreco.text);
                                Produto prod = new Produto(codigo, descricao, preco);

                                prodRepo.adicionar(prod);
                                prodRepo.imprimir();
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
        title: Text('Cadastro de Produtos'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  void limpaCampos() {
    campoCodigo.clear();
    campoDescricao.clear();
    campoPreco.clear();
    focoCodigo.requestFocus();
  }

  void mostraMsgSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Produto cadastrado com sucesso'))
    );
  }
}
