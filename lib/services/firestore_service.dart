import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rancho_no_supermercado/models/produto.dart';
import 'package:rancho_no_supermercado/models/shopping_cart.dart';

class FiresotoreService {
  Firestore _db = Firestore.instance;

  Future<void> saveProduct(Produto produto) {
    return _db
        .collection('produto')
        .document(produto.codigo)
        .setData(produto.toMap());
  }

  Future<void> removeProduct(String codigo) {
    print(codigo);
    return _db.collection('produto').document(codigo).delete();
  }

  Stream<List<Produto>> getProducts() {
    return _db.collection('produto').orderBy('descricao').snapshots().map((snapshot) => snapshot.documents.map((document) => Produto.fromFirestore(document.data)).toList());
  }

  Future<void> saveShoppingCart(ShoppingCart shoppingCart) {
    return _db
        .collection('carrinho')
        .document(shoppingCart.carrinhoId)
        .setData(shoppingCart.toMap());
  }


  Stream<List<ShoppingCart>> getShoppingCart() {
    return _db.collection('carrinho').snapshots().map((snapshot) => snapshot.documents.map((document) => ShoppingCart.fromFirestore(document.data)).toList());
  }

  Future<void> removeShoppingCart(String carrinhoId) {
    return _db.collection('carrinho').document(carrinhoId).delete();
  }

}
