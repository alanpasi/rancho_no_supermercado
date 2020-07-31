import 'package:flutter/material.dart';
import 'package:rancho_no_supermercado/services/auth.dart';
import 'package:rancho_no_supermercado/shared/loading.dart';
import 'package:rancho_no_supermercado/shared/constants.dart';
import 'package:rancho_no_supermercado/views/product_view.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // TODO: O quê é isso???
  bool isSubmitting = false;

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
              title: Text('Registrar novo usuário'),
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
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Digite um endereço de email',
                            labelText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Digite um email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Digite uma senha', labelText: 'Senha'),
                        validator: (val) => val.length < 6
                            ? 'Digite uma senha (mínimo 6 caracteres)'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      MaterialButton(
                        height: 54,
//                        color: Colors.deepPurpleAccent,
                        minWidth: mq.size.width / 1.2,
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        child: Text(
                          'Registrar',
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
                                .registerWithEmailAndPassword(email, password);
                            // TODO: Verificar se o endereço de email já está sendo utilizado em outra conta
                            setState(() => loading = false);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductView()));
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
                        style: TextStyle(color: Colors.red, fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
