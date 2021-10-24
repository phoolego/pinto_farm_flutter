import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/pinto_text_field.dart';

class RequestFarmerPage extends StatefulWidget {
  @override
  _RequestFarmerPageState createState() => _RequestFarmerPageState();
}

class _RequestFarmerPageState extends State<RequestFarmerPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          'ขอสิทธิ์เป็นเกษตรบางกะเจ้า',
          style: kAppbarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            PintoTextFieldWithoutHintText(
              label: 'อีเมล',
              validator: (String? val) {},
              onChanged: (val) {},
            ),
            PintoTextFieldWithoutHintText(
              label: 'รหัสผ่าน',
              validator: (String? val) {},
              onChanged: (val) {},
            ),
            PintoTextFieldWithoutHintText(
              label: 'ยืนยันรหัสผ่าน',
              validator: (String? val) {},
              onChanged: (val) {},
            ),
            PintoTextFieldWithoutHintText(
              label: 'ชื่อฟาร์ม',
              validator: (String? val) {},
              onChanged: (val) {},
            ),
            PintoTextFieldWithoutHintText(
              //TODO- ถามพี่ปี้ดเรื่องหน่วยของฟาร์ม
              label: 'ขนาดฟาร์ม (ไม่รู้หน่วย)',
              validator: (String? val) {},
              onChanged: (val) {},
            ),
            PintoButton(
              label: 'บันทึกข้อมูล',
              function: () {},
              buttonColor: deepOrange,
              width: screenWidth * 0.4,
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
