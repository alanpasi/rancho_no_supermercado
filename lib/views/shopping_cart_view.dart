import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rancho_no_supermercado/models/shopping_cart.dart';
import 'package:rancho_no_supermercado/views/edit_shopping_cart_view.dart';

class ShoppingCartView extends StatefulWidget {
  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    final shoppingCart = Provider.of<List<ShoppingCart>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho de compras',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditShoppingCartView()));
        },
      ),
      body: (shoppingCart != null)
          ? ListView.builder(
              itemCount: shoppingCart.length,
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
                      title: Text(shoppingCart[index].codigo),
                      subtitle:
                          Text('${shoppingCart[index].quantidade.toString()}'),
                      trailing: Text(shoppingCart[index].valor.toString()),
                      onLongPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditShoppingCartView(shoppingCart[index])));
                      },
                    ),
                  ),
                );
              })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
