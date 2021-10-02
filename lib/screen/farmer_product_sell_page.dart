import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/component/drop_down.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/component/status_card.dart';

class FarmerProductSale extends StatefulWidget {
  Product product;
  FarmerProductSale({Key? key, required this.product}) : super(key: key);

  @override
  _FarmerProductSaleState createState() => _FarmerProductSaleState();
}

class _FarmerProductSaleState extends State<FarmerProductSale> {
  bool _isNull(dynamic value) {
    return value == null;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
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
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.centerLeft,
                            height: 60,
                            color: lightOrange,
                            child: Text(
                              '${widget.product.typeOfProduct}',
                              style: kHeadingTextStyle,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 0.9 * screenWidth,
                        height: 60,
                        child: DropDown.sendStockProduct(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: PintoButton(
                            width: 150,
                            label: '+ เพิ่มรายการ',
                            function: () {
                              Navigator.pushNamed(context, '/product/sale/add-product');
                              print('เข้าสู่หน้าเพิ่มรายการ');
                            },
                            buttonColor: lightGrayBackground),
                      ),
                      SizedBox(
                        width: 0.1 * screenWidth,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  0.01 * screenWidth, 0.005 * screenHeight, 0.01 * screenWidth, 0.005 * screenHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.5,
                    child: ListView(
                      children: [
                        StatusCard.withoutAny(
                          function: () {
                            Navigator.pushNamed(context, '/product/sale/status');
                            print('tap');
                          },
                        ),
                        StatusCard.withoutAny(
                          function: () {
                            print('tap');
                          },
                        ),
                        StatusCard.withoutAny(
                          function: () {
                            print('tap');
                          },
                        ),
                        StatusCard.withoutAny(
                          function: () {
                            print('tap');
                          },
                        ),
                        StatusCard.withoutAny(
                          function: () {
                            print('tap');
                          },
                        ),
                        StatusCard.withoutAny(
                          function: () {
                            print('tap');
                          },
                        ),
                        StatusCard.withoutAny(
                          function: () {
                            print('tap');
                          },
                        ),
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
