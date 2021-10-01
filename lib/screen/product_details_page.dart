import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/screen/product_edit_details_page.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';

class ProductDetailsPage extends StatelessWidget {
  Product product;
  ProductDetailsPage({required this.product});
  bool _isNull(dynamic value) {
    return value == null;
  }

  @override
  Widget build(BuildContext context) {
    //String
    String nullData = 'ไม่มีข้อมูล';

    //size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          '${product.typeOfProduct}',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: deepGrayBackground),
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 0.35 * screenHeight,
                  constraints: BoxConstraints(
                    minWidth: screenWidth,
                  ),
                  alignment: AlignmentDirectional.topCenter,
                  child: Image.asset(
                    'assets/images/white_cabbage.jpg',
                  ),
                ),
              ),
              Positioned(
                top: 0.3 * screenHeight,
                child: Container(
                  height: screenHeight * 0.7 - MediaQuery.of(context).padding.top - kToolbarHeight,
                  width: screenWidth,
                  padding: EdgeInsets.fromLTRB(
                      0.04 * screenWidth, 0.01 * screenHeight, 0.04 * screenWidth, 0.01 * screenHeight),
                  // alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: deepWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    // margin: EdgeInsets.only(top: 0.1*screenHeight),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 0.01 * screenHeight),
                          padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                          decoration: BoxDecoration(
                            color: lightGrayBackground,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('พื้นที่การปลูก', style: kNormalTextStyle),
                                        Text('${product.area} ${product.areaUnit}', style: kNormalTextStyle)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('วันที่เริ่มปลูก', style: kNormalTextStyle),
                                        Text(DateFormat.getFullDate(product.plantDate), style: kNormalTextStyle),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                          decoration: BoxDecoration(color: deepWhite),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('ปริมาณที่คาดว่าจะได้', style: kNormalTextStyle),
                                        Text('${product.predictAmount} ${product.unit}', style: kNormalTextStyle)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('วันที่คาดว่าจะได้', style: kNormalTextStyle),
                                        Text(DateFormat.getFullDate(product.predictHarvestDate),
                                            style: kNormalTextStyle)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                          decoration: BoxDecoration(
                            color: lightGrayBackground,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('ปริมาณที่เก็บเกี่ยว', style: kNormalTextStyle),
                                        Text(
                                          '${_isNull(product.harvestAmount) ? nullData : product.harvestAmount} ${product.unit}',
                                          style:
                                              _isNull(product.harvestAmount) ? kNormalAlertTextStyle : kNormalTextStyle,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('วันที่เก็บเกี่ยว', style: kNormalTextStyle),
                                        Text(
                                          _isNull(product.harvestDate)
                                              ? nullData
                                              : DateFormat.getFullDate(product.harvestDate!),
                                          style:
                                              _isNull(product.harvestAmount) ? kNormalAlertTextStyle : kNormalTextStyle,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                          decoration: BoxDecoration(color: deepWhite),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('ปริมาณที่ส่งขาย', style: kNormalTextStyle),
                                        Text('$nullData ${product.unit}', style: kNormalAlertTextStyle)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('ราคาต่อหน่วย', style: kNormalTextStyle),
                                        Text('${product.buyPrice} ${product.priceUnit}/${product.unit}',
                                            style: kNormalTextStyle)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0.005 * screenHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  //IF farmer already add data, it will can't press the button
                                  ElevatedButton(
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(0.01 * screenWidth, 0.005 * screenHeight,
                                            0.01 * screenWidth, 0.005 * screenHeight),
                                        child: Text('แก้ไขข้อมูล', style: whiteSmallNormalTextStyle)),
                                    style: ElevatedButton.styleFrom(primary: deepOrange),
                                    onPressed: () {
                                      print('Pressed');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProductEditDetailsPage(product: this.product)),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0.005 * screenHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  ElevatedButton(
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(0.01 * screenWidth, 0.005 * screenHeight,
                                            0.01 * screenWidth, 0.005 * screenHeight),
                                        child: Text('รายการส่งขาย', style: blackSmallNormalTextStyle)),
                                    style: ElevatedButton.styleFrom(
                                      primary: lightOrange,
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/product/sale');
                                      print('Pressed');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 0.05 * screenHeight,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
