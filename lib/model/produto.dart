class Produto {
  //atributos
  int _codigo;
  String _descricao;
  double _preco;

  //construtor
  Produto(this._codigo, this._descricao, this._preco);

  //getters e setters
  int get codigo => this._codigo;

  set codigo(int value) => this._codigo = value;

  get descricao => this._descricao;

  set descricao(value) => this._descricao = value;

  get preco => this._preco;

  set preco(value) => this._preco = value;
}
