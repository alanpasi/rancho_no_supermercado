import 'package:dropdownfield/dropdownfield.dart';
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
  final categoriaController = TextEditingController();

//  var _categorias = [
//    'Categoria',
//    'BAZAR',
//    'BEBIDAS',
//    'CARNES',
//    'ELETRO',
//    'FIAMBRERIA',
//    'LIMPEZA',
//    'MATINAIS',
//    'MERCEARIA'
//  ];
//  var _currentItemSelected = 'Categoria';

  final categoriaSelected = TextEditingController();

  String selectCategoria = '';

  List<String> categorias = [
    'BAZAR',
    'BEBIDAS',
    'CARNES',
    'ELETRO',
    'FIAMBRERIA',
    'LIMPEZA',
    'MATINAIS',
    'MERCEARIA'
  ];

  @override
  void dispose() {
    codigoController.dispose();
    descricaoController.dispose();
    unidadeController.dispose();
    valorController.dispose();
    categoriaController.dispose();
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
      categoriaController.text = '';
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
      categoriaController.text = widget.produto.categoria;
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
//            TextField(
//              decoration: InputDecoration(
//                hintText: 'Categoria',
//              ),
//              controller: categoriaController,
//              onChanged: (value) {
//                productProvider.changeCategoria(value);
//              },
//            ),
            DropDownField(
              controller: categoriaController,
              hintText: 'Selecione uma categoria',
              hintStyle: TextStyle(fontSize: 14.0),
              enabled: true,
              items: categorias,
              textStyle: TextStyle(color: Colors.white, fontSize: 16.0),
              onValueChanged: (value) {
                setState(() {
                  selectCategoria = value;
                  productProvider.changeCategoria(value);
                });
              },
            ),
//            Padding(
//              padding: const EdgeInsets.all(30.0),
//              child: DropdownButton<String>(
//                items: _categorias.map((String dropDownStringItem) {
//                  return DropdownMenuItem<String>(
//                    value: dropDownStringItem,
//                    child: Text(dropDownStringItem),
//                  );
//                }).toList(),
//                onChanged: (String newValueSelected) {
//                  categoriaController.text = newValueSelected;
//                  productProvider.changeCategoria(newValueSelected);
//                  // TODO: ação quando selecionado
//                  setState(() {
//                    _currentItemSelected = newValueSelected;
//                  });
//                },
//                value: _currentItemSelected,
//              ),
//            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              height: 54.0,
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
              child: Text(
                'Gravar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                productProvider.saveProduct();
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 12.0),
            (widget.produto != null)
                ? MaterialButton(
                    height: 54.0,
                    padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                    child: Text(
                      'Apagar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      productProvider.removeProduct(widget.produto.codigo);
                      Navigator.of(context).pop();
                    },
                  )
                : MaterialButton(
                    height: 54.0,
                    padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                    child: Text(
                      'Ler Código de barras',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      FlutterBarcodeScanner.scanBarcode(
                              '#000000', 'Cancelar', true, ScanMode.BARCODE)
                          .then((value) => setState(() {
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
