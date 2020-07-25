import 'package:flutter/material.dart';
import 'package:rancho_no_supermercado/services/auth.dart';
import 'package:rancho_no_supermercado/shared/constants.dart';
import 'package:rancho_no_supermercado/shared/loading.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              title: Text('Entrar'),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(36),
                child: Container(
                  height: mq.size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Digite um email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Digite um endereço de email válido',
                            labelText: 'Email'),
                      ),
                      TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Digite uma senha (mínimo 6 caracteres)'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Digite uma senha válida',
                            labelText: 'Senha'),
                      ),
                      MaterialButton(
                        height: 54,
                        color: Colors.deepPurpleAccent,
                        minWidth: mq.size.width / 1.2,
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        child: Text(
                          'Entrar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            //TODO: passar o endereço de email para a tela MainView
                            Navigator.pushReplacementNamed(context, '/mainView');
                            setState(() => loading = false);
                            if (result == null) {
                              setState(() {
                                error = 'Favor digitar um email válido';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
