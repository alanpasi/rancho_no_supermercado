class Produto {
  final String codigo;
  final String descricao;
  final String unidade;
  final double valor;
  final String categoria;

  Produto(
      {this.codigo, this.descricao, this.unidade, this.valor, this.categoria});

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'unidade': unidade,
      'valor': valor,
      'categoria': categoria
    };
  }

  Produto.fromFirestore(Map<String, dynamic> firestore)
      : codigo = firestore['codigo'],
        descricao = firestore['descricao'],
        unidade = firestore['unidade'],
        valor = firestore['valor'],
        categoria = firestore['categoria'];
}
