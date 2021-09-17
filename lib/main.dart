import 'package:flutter/material.dart';
import 'package:pinto_flutter/screen/Login_page.dart';
import 'package:pinto_flutter/screen/farmer_product_sale_Page.dart';
import 'component/SideMenu.dart';
import 'package:pinto_flutter/screen/product_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: productListPage(),
      //home: FarmerProductSale(),
    );
  }
}
