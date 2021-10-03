import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pinto_farmer_flutter/constant.dart';

class StatusProductSellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String productName = 'ผักกาดขาว';
    String status = 'ยังไม่ส่งผลผลิต';
    String date = '01/06/2021';
    double numberOfSelling = 100;
    double totalCost = 300.25;
    String productUnit = 'กรัม';

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          'ชื่อผลิตภัณฑ์: $productName',
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
        height: screenHeight,
        width: screenWidth,
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
                              padding: EdgeInsets.only(
                                  left: 40, top: 20, bottom: 20),
                              height: screenHeight * 0.17,
                              color: lightOrange,
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
                                          'ชื่อผลิตภัณฑ์: $productName',
                                          style: kSubHeadingBoldTextStyle,
                                        ),
                                        Text(
                                          'ปลูกวันที่: $date',
                                          style: kTextdetailGreyColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'สถานะ    ',
                                          style: kSubHeadingBoldTextStyle,
                                        ),
                                        Text(
                                          status,
                                          style: kStatusNotCompleteTextColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'ปริมาณที่คาดว่าจะส่งขาย',
                          style: kContentTextStyle,
                        ),
                        Text(
                          numberOfSelling.toString(),
                          style: kContentTextStyle,
                        ),
                        Text(
                          productUnit,
                          style: kContentTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.2,
                        ),
                        Text(
                          'เป็นราคา',
                          style: kContentTextStyle,
                        ),
                        Text(
                          totalCost.toString(),
                          style: kContentTextStyle,
                        ),
                        Text(
                          'บาท',
                          style: kContentTextStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.6,
                  child: InkWell(
                    onTap: (){
                      print('tap at picture just in case to download it.');
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      //color: Colors.grey,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                  ),
                ),
                Container(child: Text('หลักฐานการโอนเงิน',style: kContentTextStyle,),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
