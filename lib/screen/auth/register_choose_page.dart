import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/status_card.dart';

class RegisterChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: deepOrange,
          title: Text(
            'เลือกวิธีการสร้างบัญชี',
            style: kNormalTextStyle,
          ),
          elevation: 0,
        ),
        body: Container(
          color: deepWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register/request-farmer');
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightOrange,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'ขอสิทธิ์เป็นเกษตรบางกะเจ้า',
                                      style: kHeadingTextStyle,
                                    ),
                                  ),
                                  Text(
                                    ': มีบัญชีอยู่แล้ว\nต้องการขอสิทธิ์เป็นเกษตรกร',
                                    style: kContentTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/register/register-farmer');
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightOrange,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'ยังไม่มีบัญชีในระบบปิ่นโต',
                                      style: kHeadingTextStyle,
                                    ),
                                  ),
                                  Text(
                                    ': สร้างบัญชีใหม่และ\nขอสิทธิ์เป็นเกษตรกร',
                                    style: kContentTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Text('')),
            ],
          ),
        ));
  }
}
