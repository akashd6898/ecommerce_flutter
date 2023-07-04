import 'package:ecommerce/checkout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'login_page/login_page.dart';
import 'routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      //initialRoute: MyRoutes.checkoutpage,
      routes: {
        MyRoutes.loginpage: (context) => const LoginPage(),
        MyRoutes.homepage: (context) => const HomePage(),
        //MyRoutes.productpage: (context) => const ProductPage(productDetails: productDetails)
        MyRoutes.checkoutpage: (context) => CheckoutPage()
      });
  }
}