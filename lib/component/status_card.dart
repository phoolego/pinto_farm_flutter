import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/stock_product.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';

class StatusCard extends StatelessWidget {
  StockProduct stockProduct;
  var function;

  StatusCard({required this.stockProduct, required this.function});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: function,
      child: Container(
        alignment: AlignmentDirectional.center,
        width: screenWidth * 0.1,
        padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: lightOrange,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'รายการส่งขายวันที่: ${DateFormat.getFullDate(stockProduct.createDate)}',
                        style: kNormalTextStyle,
                      ),
                      Text(
                        'จำนวน: ${stockProduct.sspAmount} ${stockProduct.unit}',
                        style: kNormalTextStyle,
                      ),
                      Row(
                        children: [
                          Text(
                            'สถานะ  ',
                            style: kNormalTextStyle,
                          ),
                          Text(
                            stockProduct.getStatus(),
                            style: stockProduct.getStatusTextStyle(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_horiz_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
