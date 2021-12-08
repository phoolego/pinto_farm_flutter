import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';

class RegisterChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: deepOrange,
          title: const Text(
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
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightOrange,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'ขอสิทธิ์เป็นเกษตรบางกะเจ้า',
                                  style: kHeadingTextStyle,
                                ),
                                Text(
                                  'มีบัญชีอยู่แล้ว ต้องการขอสิทธิ์เป็นเกษตรกร',
                                  style: kTextdetailGreyColor,
                                ),
                              ],
                            ),
                          ),
                        ],
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
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: lightOrange,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'ยังไม่มีบัญชีในระบบปิ่นโต',
                                  style: kHeadingTextStyle,
                                ),
                                Text(
                                  'สร้างบัญชีใหม่และขอสิทธิ์เป็นเกษตรกร',
                                  style: kTextdetailGreyColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
