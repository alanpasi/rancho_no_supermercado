import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  String codigo;
  String descricao;
  String unidade;
  double valor;

//  Produto({this.codigo, this.descricao, this.unidade, this.valor});

  Produto.fromMap(Map<String, dynamic> data) {
    codigo = data['codigo'];
    descricao = data['descricao'];
    unidade = data['unidade'];
    valor = data['valor'];
  }
}
