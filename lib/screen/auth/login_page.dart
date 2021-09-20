import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String errorMessage = '';
  bool _loading = false;
  _login(BuildContext context) async {
    try {
      setState(() {
        _loading = true;
      });
      await Auth.login(email, password);
      Navigator.pushReplacementNamed(context, '/');
    } catch (err) {
      print(err);
      errorMessage = err.toString();
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? const Center(child: Text('login loading...'))
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 250,
                              height: 250,
                              child: Image.asset('assets/images/Icons.jpg'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Farmer',
                                  style: kLoginHeadingTextStyle,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: kLoginHeadingTextStyle,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'E-mail',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'E-mail is a required filed.';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    // validate password must longer than 6 character
                                    return 'Password is a required filed.';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  setState(() {
                                    password = val;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 5),
                            Text(errorMessage,style: kStatusNotCompleteTextColor,),
                            SizedBox(height: 10),
                            PintoButton(
                                width: screenWidth * 0.4,
                                label: 'เข้าสูระบบ',
                                function: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await _login(context);
                                  }
                                },
                                buttonColor: Colors.amber),
                            SizedBox(height: 10),
                            PintoButton(
                                width: screenWidth * 0.4,
                                label: 'สร้างบัญชี',
                                function: () async {
                                  Navigator.pushNamed(context, '/register');
                                },
                                buttonColor: Colors.amber),
                            SizedBox(height: 10),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
