class ShoppingCart {
  final String carrinhoId;
  final String codigo;
  final double quantidade;
  final double valor;


  ShoppingCart({this.carrinhoId, this.codigo, this.quantidade, this.valor});

  Map<String, dynamic> toMap() {
    return {
      'carrinhoId': carrinhoId,
      'codigo': codigo,
      'quantidade': quantidade,
      'valor': valor
    };
  }

  ShoppingCart.fromFirestore(Map<String, dynamic> firestore)
      : carrinhoId = firestore['carrinhoId'],
        codigo = firestore['codigo'],
        quantidade = firestore['quantidade'],
        valor = firestore['valor'];
}
