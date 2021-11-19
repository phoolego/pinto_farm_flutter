import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

import '../constant.dart';

class MyProfileEditPage extends StatefulWidget {
  @override
  State<MyProfileEditPage> createState() => _MyProfileEditPageState();
}

class _MyProfileEditPageState extends State<MyProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  String farmName = Auth.farmer.farmName!;
  double maxArea = Auth.farmer.farmMaxArea!;
  final String _unitArea = 'ตร.ม';
  String firstname = Auth.farmer.firstname;
  String lastname = Auth.farmer.lastname;
  String address = Auth.farmer.address;
  String contact = Auth.farmer.contact;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: const Text(
          'แก้ไขโปรไฟล์',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
          width: screenWidth,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ชื่อ', style: kNormalTextStyle),
                          TextFormField(
                            initialValue: Auth.farmer.firstname,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกชื่อ';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              firstname = value;
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('นามสกุล', style: kNormalTextStyle),
                          TextFormField(
                            initialValue: Auth.farmer.lastname,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกนามสกุล';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              lastname = value;
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ชื่อฟาร์ม', style: kNormalTextStyle),
                          TextFormField(
                            initialValue: Auth.farmer.farmName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกชื่อฟาร์ม';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              farmName = value;
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('พื้นที่ฟาร์มทั้งหมด',
                              style: kNormalTextStyle),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: Auth.farmer.farmMaxArea.toString(),
                            decoration: InputDecoration(
                              suffixText: _unitArea,
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'กรุณากรอกพื้นที่ฟาร์มทั้งหมด';
                              } else if (num.tryParse(value) == null ||
                                  double.parse(value) <= 0) {
                                return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              if (num.tryParse(value) != null &&
                                  double.parse(value) > 0) {
                                maxArea = double.parse(value);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('ที่อยู่', style: kNormalTextStyle),
                          TextFormField(
                            minLines: 3,
                            maxLines: 5,
                            initialValue: Auth.farmer.address,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return 'กรุณากรอกที่อยู่';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              address = val;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 0.01 * screenHeight,
                          bottom: 0.01 * screenHeight),
                      width: 0.8 * screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('เบอร์โทรศัพท์ที่ติดต่อได้',
                              style: kNormalTextStyle),
                          TextFormField(
                            initialValue: Auth.farmer.contact,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return 'กรุณากรอกเบอร์โทรศัพท์ที่ติดต่อได้';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) {
                              contact = val;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.01 * screenHeight),
                      child: Column(
                        children: [
                          PintoButton(
                            width: 200,
                            label: 'ยืนยันการแก้ไข',
                            function: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  // await Auth.updateFarmer(farmName, maxArea,
                                  //     firstname, lastname, address, contact);
                                  // Navigator.pop(context);
                                  // Navigator.pushReplacementNamed(
                                  //     context, '/profile');
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text('คำเตือน',
                                                style: kHeadingTextStyle),
                                            content: const Text(
                                                'กด "ตกลง" เพื่อทำรายการต่อ',
                                                style: kContentTextStyle),
                                            actions: <Widget>[
                                              InkWell(
                                                  child: const Text(
                                                    'ยกเลิก',
                                                    style: kContentTextStyle,
                                                  ),
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  }),
                                              InkWell(
                                                child: const Text(
                                                  'ตกลง',
                                                  style: kContentTextStyle,
                                                ),
                                                onTap: () async {
                                                  await Auth.updateFarmer(farmName, maxArea,
                                                      firstname, lastname, address, contact);
                                                  Navigator.pop(context);
                                                  Navigator.pushReplacementNamed(
                                                      context, '/profile');
                                                },
                                              )
                                            ],
                                          ),
                                  );
                                } catch (err) {
                                  setState(() {
                                    _errorMessage = err.toString();
                                  });
                                }
                              }
                            },
                            buttonColor: deepOrange,
                            textStyle: whiteSmallNormalTextStyle,
                          ),

                          // PintoButton(
                          //   width: 200,
                          //   label: 'ยืนยันการแก้ไข',
                          //   function: () async {
                          //     if (_formKey.currentState!.validate()) {
                          //       try {
                          //         await Auth.updateFarmer(farmName, maxArea,
                          //             firstname, lastname, address, contact);
                          //         Navigator.pop(context);
                          //         Navigator.pushReplacementNamed(
                          //             context, '/profile');
                          //       } catch (err) {
                          //         setState(() {
                          //           _errorMessage = err.toString();
                          //         });
                          //       }
                          //     }
                          //   },
                          //   buttonColor: deepOrange,
                          //   textStyle: whiteSmallNormalTextStyle,
                          // ),
                          Text(
                            _errorMessage,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
