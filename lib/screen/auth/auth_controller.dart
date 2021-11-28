import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/model/farmer.dart';
import 'package:pinto_farmer_flutter/screen/auth/login_page.dart';
import 'package:pinto_farmer_flutter/screen/product_list_page.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

class AuthController extends StatefulWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  _AuthControllerState createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Farmer>(
      future: Auth.getLoginUser(),
      builder: (BuildContext context, AsyncSnapshot<Farmer> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          Farmer? farmer = snapshot.data;
          if(farmer!.userId==0){
            return LoginPage();
          }else{
            return ProductListPage();
          }
        }
      },
    );
  }
}
