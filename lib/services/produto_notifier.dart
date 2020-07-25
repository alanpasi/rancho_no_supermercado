import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:rancho_no_supermercado/models/produto.dart';

class ProdutoNotifier with ChangeNotifier {
  List<Produto> _produtoList = [];
  Produto _currentProduto;

  UnmodifiableListView<Produto> get produtoList => UnmodifiableListView(_produtoList);

  Produto get currentProduto => _currentProduto;

  set produtoList(List<Produto> produtoList) {
    _produtoList = produtoList;
    notifyListeners();
  }

  set currentProduto(Produto produto) {
    _currentProduto = produto;
    notifyListeners();
  }
}