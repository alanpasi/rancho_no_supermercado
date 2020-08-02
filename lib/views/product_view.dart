import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rancho_no_supermercado/models/produto.dart';
import 'package:rancho_no_supermercado/views/edit_product_view.dart';
import 'package:rancho_no_supermercado/views/shopping_cart_view.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Produto>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Produtos Cadastrados',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text(
              'Sair',
              style: TextStyle(fontSize: 14.0),
            ),
            onPressed: () async {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'Itens no carrinho',
            heroTag: 'shoppingCartView',
            onPressed: () {
              Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => ShoppingCartView())));
            },
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(
            height: 20.0,
          ),
          FloatingActionButton(
            tooltip: 'Adiciona produto',
            heroTag: 'editProductView',
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProductView()));
            },
          ),
        ],
      ),
      body: (products != null)
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListTile(
                      title: Text(products[index].codigo),
                      subtitle: Text(
                          '${products[index].descricao}\n${products[index].unidade} - ${products[index].categoria}'),
                      isThreeLine: true,
                      trailing: Text(products[index].valor.toString()),
                      onLongPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditProductView(products[index])));
                      },
                    ),
                  ),
                );
              })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
