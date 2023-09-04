import 'package:cadastros/model/produto.dart';

class ProdutoRepository {
  //atributo
  List<Produto> _listaProduto = [];

  //construtor
  ProdutoRepository() {
    this._listaProduto = [];
  }

  //adicionar Produto à lista
  void adicionar(Produto produto) {
    _listaProduto.add(produto);
  }

  void imprimir() {
    for(var i = 0; i < _listaProduto.length; i++) {
      print("Código: ${_listaProduto[i].codigo}, Descrição: ${_listaProduto[i].descricao}, Preço: ${_listaProduto[i].preco}");
    }
    print("================================");
  }
}