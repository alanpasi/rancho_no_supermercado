import 'package:flutter/material.dart';
import 'package:rancho_no_supermercado/views/loging_view.dart';
import 'package:rancho_no_supermercado/views/register_view.dart';

class OpeningView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

//    final logo = Image.asset(
//      'Zaffari_Toldo.png',
//      height: mq.size.height / 4,
//    );

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text('Rancho no Supermercado'),
        ),
        body: Container(
//          padding: EdgeInsets.all(80.0),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MaterialButton(
                  height: 54,
//                  color: Color(0xffbc477b),
                  minWidth: mq.size.width / 1.2,
                  child: Text(
                    'Entrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginView()));
                  },
                ),
                SizedBox(height: 24),
                MaterialButton(
                  height: 54,
//                  color: Colors.deepPurpleAccent,
                  minWidth: mq.size.width / 1.2,
                  child: Text(
                    'Registrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterView()));
                  },
                )
              ],
            ),
          ),
        ),
      );
  }
}
