import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/stock_product.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';

class ProductSaleStatusPage extends StatelessWidget {
  StockProduct stockProduct;
  ProductSaleStatusPage({required this.stockProduct});
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          stockProduct.name,
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                                color: lightOrange,
                              ),
                              // height: screenHeight * 0.17,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ชื่อผลิตภัณฑ์: ${stockProduct.name}',
                                          style: kSubHeadingBoldTextStyle,
                                        ),
                                        Text(
                                          'ปลูกวันที่: ${DateFormat.getFullDate(stockProduct.plantDate)}',
                                          style: kTextdetailGreyColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'สถานะ    ',
                                          style: kSubHeadingBoldTextStyle,
                                        ),
                                        Text(
                                          stockProduct.getStatus(),
                                          style: stockProduct.getStatusTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.1, screenHeight * 0.05, screenWidth * 0.1, screenHeight*0.05),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'ปริมาณที่จะส่งขาย',
                            style: kContentTextStyle,
                          ),
                          Text(
                            'เป็นราคา',
                            style: kContentTextStyle,
                          ),
                          Text(
                            'วันที่ส่งผลิตภัณฑ์',
                            style: kContentTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            stockProduct.sspAmount.toString(),
                            style: kContentTextStyle,
                          ),
                          Text(
                            stockProduct.sspPrice.toString(),
                            style: kContentTextStyle,
                          ),
                          Text(
                            DateFormat.getFullDate(stockProduct.createDate),
                            style: kContentTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            stockProduct.unit,
                            style: kContentTextStyle,
                          ),
                          const Text(
                            'บาท',
                            style: kContentTextStyle,
                          ),
                          const Text(
                            '',
                            style: kContentTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  stockProduct.tranPic==null?SizedBox(
                    height: screenWidth * 1.4,
                    width: screenWidth * 0.8,
                    child: InkWell(
                      onTap: (){
                        print('tap at picture just in case to download it.');
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Image.asset('assets/images/Icons.jpg'),
                      ),
                    ),
                  ):Container(
                    width: screenWidth*0.8,
                    height: screenWidth*1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(stockProduct.tranPic!),
                      ),
                    ),
                  ),
                  const Text('หลักฐานการโอนเงิน',style: kContentTextStyle,),
                  const SizedBox(height: 20,)
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
