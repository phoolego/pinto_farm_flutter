import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';

class AddSellProductPage extends StatelessWidget {
  String productUnit = 'กรัม';
  double productPrice = 00.00;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 154, 0),
        title: Text(
          'เพิ่มรายการ',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        alignment: Alignment.topCenter,
        //color: deepGrayBackground,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ปริมาตรที่คาดว่าจะส่งขาย',
                      style: kHeadingTextStyle,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: 'Prompht'),
                            decoration: const InputDecoration(
                              // hintTextDirection: TextDirection.rtl,
                              // hintText: 'กรัม',
                              // hintStyle: TextStyle(fontFamily: 'Prompht'),
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            productUnit,
                            style: kContentTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'เป็นราคา',
                          style: kContentTextStyle,
                        ),
                        Text(
                          '$productPrice',
                          style: kContentTextStyle,
                        ),
                        Text(
                          'บาท',
                          style: kContentTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight*0.05),
                    child: PintoButton(
                      width: screenWidth * 0.35,
                      label: 'บันทึกข้อมูล',
                      function: () {
                        Navigator.pop(context);
                        print('save');
                      },
                      buttonColor: Colors.amber,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
