import 'package:flutter/material.dart';
import 'package:rancho_no_supermercado/models/produto.dart';
import 'package:rancho_no_supermercado/services/firestore_service.dart';

class ProductProvider with ChangeNotifier {
  final firestoreService = FiresotoreService();
  String _codigo;
  String _descricao;
  String _unidade;
  double _valor;
  String _categoria;

  // getters
  String get codigo => _codigo;

  String get descricao => _descricao;

  String get unidade => _unidade;

  double get valor => _valor;

  String get categoria => _categoria;

  // setters
  changeCodigo(String value) {
    _codigo = value;
    notifyListeners();
  }

  changeDescricao(String value) {
    _descricao = value;
    notifyListeners();
  }

  changeUnidade(String value) {
    _unidade = value;
    notifyListeners();
  }

  changeValor(String value) {
    _valor = double.parse(value);
    notifyListeners();
  }

  changeCategoria(String value) {
    _categoria = value;
    notifyListeners();
  }

  saveProduct() {
    print(_codigo);
    print('codigo: $codigo');
    if (_codigo == null) {
      print('_codigo É NULL!!!!!!!');
      var newProduct = Produto(
          codigo: codigo, descricao: descricao, unidade: unidade, valor: valor, categoria: categoria);
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
      var updatedProduct = Produto(
          codigo: codigo, descricao: descricao, unidade: unidade, valor: valor, categoria: categoria);
      firestoreService.saveProduct(updatedProduct);
    }
  }

  removeProduct(String codigo) {
    firestoreService.removeProduct(codigo);
  }

  loadValues(Produto produto) {
    _codigo = produto.codigo;
    _descricao = produto.descricao;
    _unidade = produto.unidade;
    _valor = produto.valor;
    _categoria = produto.categoria;
  }
}
