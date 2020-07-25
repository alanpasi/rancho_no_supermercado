import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rancho_no_supermercado/services/auth.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rancho no Supermercado'),
        // TODO: Montar tela principal
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sair'),
            onPressed: () async {
              await _auth.signOut();
              SystemNavigator.pop();
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.topRight,
        // TODO: receber o email enviado pela tela LoginView
        child: Text('TODO: o email logado fica aqui...'),
      ),
    );
  }
}
