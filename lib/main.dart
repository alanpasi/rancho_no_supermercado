import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rancho_no_supermercado/providers/product_provider.dart';
import 'package:rancho_no_supermercado/providers/shopping_cart_provider.dart';
import 'package:rancho_no_supermercado/views/opening_view.dart';
import 'package:rancho_no_supermercado/services/firestore_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FiresotoreService();
    // fixa o aplicativo em modo retrato
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ShoppingCartProvider()),
        StreamProvider(create: (context) => firestoreService.getProducts()),
        StreamProvider(create: (context) => firestoreService.getShoppingCart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff560027),
          accentColor: Color(0xffbc477b),
          brightness: Brightness.dark,
        ),
        title: 'Rancho no Supermercado',
//        home: ProductView(),
        home: OpeningView(),
      ),
    );
  }
}
