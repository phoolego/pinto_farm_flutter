import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinto_farmer_flutter/component/pinto_text_field.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';

class RegisterFarmerPage extends StatefulWidget {
  @override
  _RegisterFarmerPageState createState() => _RegisterFarmerPageState();
}

class _RegisterFarmerPageState extends State<RegisterFarmerPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 154, 0),
        title: Text(
          'สร้างบัญชีใหม่ในระบบ',
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
              label: 'ยืนยันอีเมล',
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
              label: 'ชื่อ',
              validator: (String? val) {},
              onChanged: (val) {},
            ),
            PintoTextFieldWithoutHintText(
              label: 'นามสกุล',
              validator: (String? val) {},
              onChanged: (val) {},
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ที่อยู่',
                      style: kContentTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: TextFormField(
                      minLines: 3,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      validator: (String? validator) {},
                      onChanged: (val) {},
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'เบอร์โทรศัพท์ที่ติดต่อได้',
                      style: kContentTextStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      validator: (String? validator) {},
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
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
              height: screenHeight * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
