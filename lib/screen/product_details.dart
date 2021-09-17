import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_flutter/constant.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
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
                // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(children: [
                  Container(
                      constraints: BoxConstraints(
                          minWidth: deviceHeight,
                          maxHeight: 0.3 * deviceHeight),
                      alignment: AlignmentDirectional.topCenter,
                      child: Image.asset(
                        'assets/images/white_cabbage.jpg',
                      )),
                  Container(
                      constraints: BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: 0.6 * deviceHeight),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          color: deepWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(children: [
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(top: 10),
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
                                        width: 180.0,
                                        height: 75.0,
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
                                        width: 180.0,
                                        height: 75.0,
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
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(color: deepWhite),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(children: [
                                    Container(
                                        width: 180.0,
                                        height: 75.0,
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
                                        width: 180.0,
                                        height: 75.0,
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
                            padding: EdgeInsets.only(top: 10),
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
                                        width: 180.0,
                                        height: 75.0,
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
                                        width: 180.0,
                                        height: 75.0,
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
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(color: deepWhite),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(children: [
                                    Container(
                                        width: 180.0,
                                        height: 75.0,
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
                                        width: 180.0,
                                        height: 75.0,
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
                            padding: EdgeInsets.only(top: 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 5, 5, 10),
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
                            padding: EdgeInsets.only(top: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 5, 5, 10),
                                            child: Text('รายการส่งขาย',
                                                style:
                                                blackSmallNormalTextStyle)),
                                        style: ElevatedButton.styleFrom(
                                          primary: lightOrange,
                                        ),
                                        onPressed: () {
                                          print('Pressed');
                                        },
                                      )
                                    ],
                                  ),
                                ]))
                      ]))
                ]))));
  }
}
