import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/drop_down.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/component/productListCard.dart';
import 'package:pinto_farmer_flutter/component/status_card.dart';

class FarmerProductSale extends StatefulWidget {
  @override
  _FarmerProductSaleState createState() => _FarmerProductSaleState();
}

class _FarmerProductSaleState extends State<FarmerProductSale> {
  String productName = 'ผักกาดขาว';
  Color kColorButton = Colors.white70;
  //TODO - not sure about color code

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 154, 0),
        title: Text(
          'รายการที่ส่งขาย',
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
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.centerLeft,
                            height: 60,
                            color: Colors.amber,
                            child: Text(
                              'ชื่อผลิตภัณฑ์: $productName',
                              style: kHeadingTextStyle,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DropDown.withoutAny(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: PintoButton(
                            label: '+ เพิ่มรายการ',
                            function: () {
                              Navigator.pushNamed(context, '/product/sale/addProduct');
                              setState(() {


                                print('add product button');
                              });
                            },
                            buttonColor: lightGrayBackground),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.58,
                    child: ListView(
                      children: [
                        StatusCard.withoutAny(function: (){
                          print('tap');
                        },),
                        StatusCard.withoutAny(function: (){
                          print('tap');
                        },),
                        StatusCard.withoutAny(function: (){
                          print('tap');
                        },),
                        StatusCard.withoutAny(function: (){
                          print('tap');
                        },),
                        StatusCard.withoutAny(function: (){
                          print('tap');
                        },),
                        StatusCard.withoutAny(function: (){
                          print('tap');
                        },),
                        StatusCard.withoutAny(function: (){
                          print('tap');
                        },),




                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
