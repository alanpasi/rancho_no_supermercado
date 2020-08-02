import 'package:flutter/material.dart';
import 'package:rancho_no_supermercado/models/shopping_cart.dart';
import 'package:rancho_no_supermercado/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class ShoppingCartProvider with ChangeNotifier {
  final firestoreService = FiresotoreService();
  String _codigo;
  double _quantidade;
  double _valor;
  String _carrinhoId;
  var uuid = Uuid();

  // getters
  String get codigo => _codigo;

  double get quantidade => _quantidade;

  double get valor => _valor;

  // setters
  changeCodigo(String value) {
    _codigo = value;
    notifyListeners();
  }

  changeQuantidade(String value) {
    _quantidade = double.parse(value);
    notifyListeners();
  }

  changeValor(String value) {
    _valor = double.parse(value);
    notifyListeners();
  }

  saveShoppingCart() {
    if (_codigo == null) {
      var newShoppingCart = ShoppingCart(
          codigo: codigo, quantidade: _quantidade, valor: valor, carrinhoId: uuid.v4());
      firestoreService.saveShoppingCart(newShoppingCart);
    } else {
      //Update
      var updatedShoppingCart = ShoppingCart(
          codigo: codigo, quantidade: _quantidade, valor: valor, carrinhoId: uuid.v4());
      firestoreService.saveShoppingCart(updatedShoppingCart);
    }
  }

  removeShoppingCart(String carrinhoId) {
    firestoreService.removeShoppingCart(carrinhoId);
  }

  loadValues(ShoppingCart shoppingCart) {
    _codigo = shoppingCart.codigo;
    _quantidade = shoppingCart.quantidade;
    _valor = shoppingCart.valor;
    _carrinhoId = shoppingCart.carrinhoId;
  }
}
