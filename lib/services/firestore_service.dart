import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rancho_no_supermercado/models/produto.dart';

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
    return _db.collection('produto').snapshots().map((snapshot) => snapshot.documents.map((document) => Produto.fromFirestore(document.data)).toList());
  }
}
