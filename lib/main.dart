import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_farmer_flutter/screen/auth/login_page.dart';
import 'package:pinto_farmer_flutter/screen/farmer_product_sale_Page.dart';
import 'package:pinto_farmer_flutter/screen/product_details_page.dart';
import 'package:pinto_farmer_flutter/screen/product_list_page.dart';
import 'package:pinto_farmer_flutter/screen/add_sell_product.dart';
import 'package:pinto_farmer_flutter/screen/status_product_sell_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthController(),
        '/login': (context) => LoginPage(),
        '/product': (context) => ProductListPage(),
        '/product/detail': (context) => ProductDetailsPage(),
        '/product/sale': (context) => FarmerProductSale(),
        '/product/sale/addProduct': (context) => AddSellProductPage(),
        '/product/sale/status' : (context) => StatusProductSellPage(),
      },
      // home: productListPage(),
      //home: FarmerProductSale(),
    );
  }
}
