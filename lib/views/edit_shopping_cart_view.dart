import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rancho_no_supermercado/models/shopping_cart.dart';
import 'package:rancho_no_supermercado/providers/shopping_cart_provider.dart';

class EditShoppingCartView extends StatefulWidget {
  final ShoppingCart shoppingCart;

  EditShoppingCartView([this.shoppingCart]);

  @override
  _EditShoppingCartViewState createState() => _EditShoppingCartViewState();
}

class _EditShoppingCartViewState extends State<EditShoppingCartView> {
  final codigoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final valorController = TextEditingController();

  @override
  void dispose() {
    codigoController.dispose();
    quantidadeController.dispose();
    valorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.shoppingCart == null) {
      // new record
      codigoController.text = '';
      quantidadeController.text = '';
      valorController.text = '';
      new Future.delayed(Duration.zero, () {
        final shoppingCartProvider =
            Provider.of<ShoppingCartProvider>(context, listen: false);
        shoppingCartProvider.loadValues(ShoppingCart());
      });
    } else {
      // existing record
      // controller update
      codigoController.text = widget.shoppingCart.codigo;
      quantidadeController.text = widget.shoppingCart.quantidade.toString();
      valorController.text = widget.shoppingCart.valor.toString();
      // state update
      new Future.delayed(Duration.zero, () {
        final shoppingCartProvider =
            Provider.of<ShoppingCartProvider>(context, listen: false);
        shoppingCartProvider.loadValues(widget.shoppingCart);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Carrinho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Código'),
              controller: codigoController,
              onChanged: (value) {
                shoppingCartProvider.changeCodigo(value);
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Quantidade'),
              controller: quantidadeController,
              onChanged: (value) {
                shoppingCartProvider.changeQuantidade(value);
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Valor'),
              controller: valorController,
              onChanged: (value) {
                shoppingCartProvider.changeValor(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () {
                shoppingCartProvider.saveShoppingCart();
                Navigator.of(context).pop();
              },
              child: Text('Gravar'),
            ),
            (widget.shoppingCart != null)
                ? RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      shoppingCartProvider
                          .removeShoppingCart(widget.shoppingCart.carrinhoId);
                      Navigator.of(context).pop();
                    },
                    child: Text('Apagar'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
