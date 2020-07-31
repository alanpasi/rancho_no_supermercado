//import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  final String codigo;
  final String descricao;
  final String unidade;
  final double valor;

  Produto({this.codigo, this.descricao, this.unidade, this.valor});

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'unidade': unidade,
      'valor': valor
    };
  }

  Produto.fromFirestore(Map<String, dynamic> firestore)
  : codigo = firestore['codigo'],
  descricao = firestore['descricao'],
  unidade = firestore['unidade'],
  valor = firestore['valor'];

//  Produto.fromMap(Map<String, dynamic> data) {
//    codigo = data['codigo'];
//    descricao = data['descricao'];
//    unidade = data['unidade'];
//    valor = data['valor'];
//  }
}
