import 'package:flutter/material.dart';
import 'package:pinto_flutter/constant.dart';
import 'package:pinto_flutter/screen/product_list_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    child: Image.asset('assets/images/Icons.jpg'),
                  ),
                  Text(
                    'Farmer',
                    style: kLoginHeadingTextStyle,
                    textAlign: TextAlign.left,
                  )
                ],
              )),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login',style: kLoginHeadingTextStyle,),
                    SizedBox(height: 30,),
                    Padding(padding: EdgeInsets.all(3),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ))),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(3),
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ))),
                      ),

                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              Container(child: Column(children: [
                Container(
                  width: 200,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      productListPage()),);
                      print('Login');
                    },
                    color: Colors.amber,
                    padding: EdgeInsets.all(10),
                    child: Text('Login', style: kAppbarTextStyle,),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 200,
                  child: FlatButton(
                    onPressed: () {
                      print('Register');
                    },
                    padding: EdgeInsets.all(10),
                    child: Text('Register', style: kAppbarTextStyle,),
                  ),
                ),
              ],),)
            ],
          ),
        ),
      ),
    );
  }
}
