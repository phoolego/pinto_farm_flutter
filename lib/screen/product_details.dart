import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: deepOrange,
            title: Text(
              'ชื่อผลิตภัณฑ์: '
                  'mockup',
              style: kAppbarTextStyle,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            )),
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
                          height: 0.4 * screenHeight,
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
                        top:0.35 * screenHeight,
                        child: Container(
                          height: screenHeight*0.65-MediaQuery.of(context).padding.top - kToolbarHeight,
                          width: screenWidth,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          // alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              color: deepWhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Container(
                                  margin: EdgeInsets.only(top: 0.01*screenHeight),
                                  padding: EdgeInsets.only(top: 0.01*screenHeight),
                                  decoration: BoxDecoration(
                                      color: lightGrayBackground,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              // height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('พื้นที่การปลูก',
                                                        style: kNormalTextStyle),
                                                    Text('mockup ตารางเมตร',
                                                        style: kNormalTextStyle)
                                                  ]))
                                        ]),
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('ชื่อเกษตรกร',
                                                        style: kNormalTextStyle),
                                                    Text('mockup นายกอ',
                                                        style: kNormalTextStyle)
                                                  ]))
                                        ])
                                      ])),
                              Container(
                                  padding: EdgeInsets.only(top: 0.01*screenHeight),
                                  decoration: BoxDecoration(color: deepWhite),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('วันที่เริ่มปลูก',
                                                        style: kNormalTextStyle),
                                                    Text('mockup 10/20/30',
                                                        style: kNormalTextStyle)
                                                  ]))
                                        ]),
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('ปริมาณที่คาดว่า',
                                                        style: kNormalTextStyle),
                                                    Text('mockup 175 กรัม',
                                                        style: kNormalTextStyle)
                                                  ]))
                                        ])
                                      ])),
                              Container(
                                  padding: EdgeInsets.only(top: 0.01*screenHeight),
                                  decoration: BoxDecoration(
                                      color: lightGrayBackground,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('วันที่เก็บเกี่ยวได้',
                                                        style: kNormalTextStyle),
                                                    Text('mockup ไม่มีข้อมูล',
                                                        style: kNormalAlertTextStyle)
                                                  ]))
                                        ]),
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('ปริมาณที่เก็บเกี่ยวได้',
                                                        style: kNormalTextStyle),
                                                    Text('mockup ไม่มีข้อมูล',
                                                        style: kNormalAlertTextStyle)
                                                  ]))
                                        ])
                                      ])),
                              Container(
                                  padding: EdgeInsets.only(top: 0.01*screenHeight),
                                  decoration: BoxDecoration(color: deepWhite),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('ปริมาณที่ส่งขาย',
                                                        style: kNormalTextStyle),
                                                    Text('mockup ไม่มีข้อมูล',
                                                        style: kNormalAlertTextStyle)
                                                  ]))
                                        ]),
                                        Column(children: [
                                          Container(
                                              width: 0.43*screenWidth,
                                              height: 0.1*screenHeight,
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text('ชื่อเกษตรกร',
                                                        style: kNormalTextStyle),
                                                    Text('mockup 3 กรัม',
                                                        style: kNormalTextStyle)
                                                  ]))
                                        ])
                                      ])),
                              Container(
                                  padding: EdgeInsets.only(top: 0.005*screenHeight),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            ElevatedButton(
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.01*screenWidth, 0.005*screenHeight, 0.01*screenWidth, 0.005*screenHeight),
                                                  child: Text('แก้ไขข้อมูล',
                                                      style:
                                                      whiteSmallNormalTextStyle)),
                                              style: ElevatedButton.styleFrom(
                                                  primary: deepOrange),
                                              onPressed: () {
                                                print('Pressed');
                                              },
                                            )
                                          ],
                                        ),
                                      ])),
                              Container(
                                  padding: EdgeInsets.only(top: 0.005*screenHeight),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            ElevatedButton(
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                  0.01*screenWidth, 0.005*screenHeight, 0.01*screenWidth, 0.005*screenHeight),
                                                  child: Text('รายการส่งขาย',
                                                      style:
                                                      blackSmallNormalTextStyle)),
                                              style: ElevatedButton.styleFrom(
                                                primary: lightOrange,
                                              ),
                                              onPressed: () {
                                                Navigator.pushNamed(context, '/product/sale');
                                                print('Pressed');
                                              },
                                            )
                                          ],
                                        ),
                                      ]))
                            ]),
                          )),
                      ),
                    ],
                ),

    )));
  }
}
