import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:rancho_no_supermercado/models/produto.dart';
import 'package:rancho_no_supermercado/providers/product_provider.dart';

class EditProductView extends StatefulWidget {
  final Produto produto;

  EditProductView([this.produto]);

  @override
  _EditProductViewState createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final codigoController = TextEditingController();
  final descricaoController = TextEditingController();
  final unidadeController = TextEditingController();
  final valorController = TextEditingController();

  @override
  void dispose() {
    codigoController.dispose();
    descricaoController.dispose();
    unidadeController.dispose();
    valorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.produto == null) {
      // new record
      codigoController.text = '';
      descricaoController.text = '';
      unidadeController.text = '';
      valorController.text = '';
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(Produto());
      });
    } else {
      // existing record
      print('${codigoController.text}, ${widget.produto.codigo}');
      codigoController.text = widget.produto.codigo;
      descricaoController.text = widget.produto.descricao;
      unidadeController.text = widget.produto.unidade;
      valorController.text = widget.produto.valor.toString();
      new Future.delayed(Duration.zero, () {
        final productProvider =
            Provider.of<ProductProvider>(context, listen: false);
        productProvider.loadValues(widget.produto);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Código',
              ),
              controller: codigoController,
              onChanged: (value) {
                productProvider.changeCodigo(value);
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Descrição',
              ),
              controller: descricaoController,
              onChanged: (value) {
                productProvider.changeDescricao(value);
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Unidade',
              ),
              controller: unidadeController,
              onChanged: (value) {
                productProvider.changeUnidade(value);
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Valor Unitário',
              ),
              controller: valorController,
              onChanged: (value) {
                productProvider.changeValor(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('Gravar'),
              onPressed: () {
                productProvider.saveProduct();
                Navigator.of(context).pop();
              },
            ),
            (widget.produto != null)
                ? RaisedButton(
                    color: Colors.red,
                    child: Text('Apagar'),
                    onPressed: () {
                      productProvider.removeProduct(widget.produto.codigo);
                      Navigator.of(context).pop();
                    },
                  )
                : RaisedButton(
                    color: Colors.red,
                    child: Text('Ler Código de barras'),
                    onPressed: () {
                      FlutterBarcodeScanner.scanBarcode(
                              '#000000', 'Cancelar', true, ScanMode.BARCODE)
                          .then((value) => setState(
                              () {
                                productProvider.changeCodigo(value);
                                codigoController.text = value;
                              }));
                    },
                  ),
          ],

        ),
      ),
    );
  }
}
