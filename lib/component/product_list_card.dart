import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';

class ProductCard extends StatelessWidget {
  ProductPreview product;
  // String productName = '';
  // String dateString = '';
  // int productId = 0;
  var function;

  //not sure about img

  ProductCard({
    required this.product,
    required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: 100,
        width: 500,
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: product.productTypePicUrl!=null?Image.network(product.productTypePicUrl!,fit: BoxFit.cover,):
                    Image.asset('assets/images/Icons.jpg'),
                    //TODO- fix image to dynamic
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.typeOfProduct,
                          style: kHeadingTextStyle,
                        ),
                        Text(
                          'วันที่ปลูก: ${DateFormat.getFullDate(product.plantDate)}',
                          style: kContentTextStyle,
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Text(' ')),
                  //sorry for lazy na ;-;
                  SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(child: Icon(Icons.chevron_right)),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
