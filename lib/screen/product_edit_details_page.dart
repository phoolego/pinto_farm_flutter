import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_farmer_flutter/constant.dart';

class ProductEditDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //String
    String productName = 'ผักกาดขาว';
    double farmSize = 100;
    String unitSize = 'ตร.ม.';
    String unitAmount = 'กรัม';
    String startDate = '01/06/2021';

    //size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          '$productName',
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
                  padding: EdgeInsets.fromLTRB(0.04 * screenWidth, 0.01 * screenHeight, 0.04 * screenWidth, 0.01 * screenHeight),
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
                                        Text('$farmSize $unitSize', style: kNormalTextStyle)
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
                                      children: [Text('วันที่เริ่มปลูก', style: kNormalTextStyle), Text('$startDate', style: kNormalTextStyle)],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 0.01 * screenHeight),
                          decoration: BoxDecoration(
                            color: deepWhite,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 0.9 * screenWidth,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('วันที่เก็บเกี่ยว', style: kNormalTextStyle),
                                    TextField(
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.all(5),
                                      ),
                                    ),
                                    Text('ปริมาณที่เก็บเกี่ยว ($unitAmount)', style: kNormalTextStyle),
                                    TextField(
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.all(5),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                          height: 0.05 * screenHeight,
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
                                        padding:
                                        EdgeInsets.fromLTRB(0.01 * screenWidth, 0.005 * screenHeight, 0.01 * screenWidth, 0.005 * screenHeight),
                                        child: Text('ยืนยันแก้ไขข้อมูล', style: whiteSmallNormalTextStyle)),
                                    style: ElevatedButton.styleFrom(primary: deepOrange),
                                    onPressed: () {
                                      print('Pressed');
                                    },
                                  )
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
