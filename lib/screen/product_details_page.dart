import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/screen/product_detail_image_page.dart';
import 'package:pinto_farmer_flutter/screen/product_edit_details_page.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';
import 'package:pinto_farmer_flutter/service/product_service.dart';

import 'product_sale_list_page.dart';

class ProductDetailsPage extends StatefulWidget {
  int productId;
  Map operation;
  ProductDetailsPage({Key? key, required this.productId, required this.operation}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool _isNull(dynamic value) {
    return value == null;
  }
  void reload(){
    setState(() {
      print('reload ProductDetailsPage');
    });
  }
  @override
  Widget build(BuildContext context) {
    widget.operation['ProductDetailsPage'] = reload;
    //String
    String nullData = 'ไม่มีข้อมูล';
    //size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<Product>(
      future: ProductService.getProductDetail(widget.productId),
      builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: deepOrange,
            ),
            body: const SafeArea(
                child: Center(child: CircularProgressIndicator())
            ),
          );
        } else {
          Product? product = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: deepOrange,
              title: Text(
                product!.typeOfProduct,
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
                decoration: const BoxDecoration(color: deepGrayBackground),
                child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        height: 0.35 * screenHeight,
                        width: screenWidth,
                        child: product.productUrl!=null?Image.network(
                          product.productUrl!,
                          fit: BoxFit.cover,
                        ):
                        const Center(child: Text('เพิ่มรูปภาพการปลูก'),),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                              ProductDetailImage(productId: product.productId,operation: widget.operation,)
                          ),);
                        },
                      ),
                    ),
                    Positioned(
                      top: 0.3 * screenHeight,
                      child: Container(
                        height: screenHeight * 0.7 -
                            MediaQuery.of(context).padding.top -
                            kToolbarHeight,
                        width: screenWidth,
                        padding: EdgeInsets.fromLTRB(0.04 * screenWidth, 0.01 * screenHeight,
                            0.04 * screenWidth, 0.01 * screenHeight),
                        // alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          color: deepWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              // height: screenHeight * 0.35,
                              child: ListView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 0.01 * screenHeight),
                                    padding: EdgeInsets.only(
                                        top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                                    decoration: const BoxDecoration(
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
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('พื้นที่การปลูก', style: kNormalTextStyle),
                                                  Text('${product.area} ${product.areaUnit}',
                                                      style: kNormalTextStyle)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('วันที่เริ่มปลูก', style: kNormalTextStyle),
                                                  Text(DateFormat.getFullDate(product.plantDate),
                                                      style: kNormalTextStyle),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                                    decoration: const BoxDecoration(color: deepWhite),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('ปริมาณที่คาดว่าจะได้', style: kNormalTextStyle),
                                                  Text('${product.predictAmount} ${product.unit}',
                                                      style: kNormalTextStyle)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('วันที่คาดว่าจะได้', style: kNormalTextStyle),
                                                  Text(
                                                    DateFormat.getFullDate(product.predictHarvestDate),
                                                    style: kNormalTextStyle,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                                    decoration: const BoxDecoration(
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
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('ปริมาณที่เก็บเกี่ยว', style: kNormalTextStyle),
                                                  Text(
                                                    '${_isNull(product.harvestAmount) ? nullData : product.harvestAmount} ${product.unit}',
                                                    style: _isNull(product.harvestAmount)
                                                        ? kNormalAlertTextStyle
                                                        : kNormalTextStyle,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('วันที่เก็บเกี่ยว', style: kNormalTextStyle),
                                                  Text(
                                                    _isNull(product.harvestDate)
                                                        ? nullData
                                                        : DateFormat.getFullDate(product.harvestDate!),
                                                    style: _isNull(product.harvestAmount)
                                                        ? kNormalAlertTextStyle
                                                        : kNormalTextStyle,
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
                                    padding: EdgeInsets.only(
                                        top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                                    decoration: const BoxDecoration(color: deepWhite),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('ปริมาณที่ส่งขาย', style: kNormalTextStyle),
                                                  product.sellingAmount==null?
                                                  Text(
                                                    '$nullData ${product.unit}',
                                                    style: kNormalAlertTextStyle,
                                                  ):
                                                  Text(
                                                    '${product.sellingAmount} ${product.unit}',
                                                    style: kNormalTextStyle,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 0.43 * screenWidth,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('ราคาต่อหน่วย', style: kNormalTextStyle),
                                                  Text(
                                                      '${product.buyPrice} ${product.priceUnit}/${product.unit}',
                                                      style: kNormalTextStyle)
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            product.status=='HARVESTED'?const SizedBox():Container(
                              padding: EdgeInsets.only(top: 0.01 * screenHeight),
                              child: PintoButton(
                                width: 200,
                                label: 'เพิ่มข้อมูลการเก็บเกี่ยว',
                                buttonColor: deepOrange,
                                textStyle: whiteSmallNormalTextStyle,
                                function: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      ProductEditDetailsPage(product: product,operation: widget.operation,)
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 0.01 * screenHeight),
                              child: PintoButton(
                                width: 200,
                                label: 'รายการส่งขาย',
                                buttonColor: lightOrange,
                                textStyle: blackSmallNormalTextStyle,
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductSaleList(product: product)
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
