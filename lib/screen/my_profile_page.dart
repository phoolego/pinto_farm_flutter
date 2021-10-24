import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/side_menu.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

class MyProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.defaultMenu('โปรไฟล์ของฉัน'),
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          'โปรไฟล์ของฉัน',
          style: kAppbarTextStyle,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0.1 * screenWidth, 0.02 * screenHeight, 0.1 * screenWidth, 0.02 * screenHeight),
          // decoration: BoxDecoration(color: deepWhite),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    width: 90,
                    height: 90,
                    child: Image.asset('assets/images/Icons.jpg'),
                  ),
                  Expanded(
                    // width: 0.48 * screenWidth,
                    child: Text(
                      '${Auth.farmer.firstname} \n${Auth.farmer.lastname}',
                      textAlign: TextAlign.left,
                      style: kNormalTextStyle,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print('${Auth.farmer.firstname} เข้าสู่หน้าแก้ไขโปรไฟล์ของฉัน');
                      Navigator.defaultRouteName;
                      //TODO:My edit profile page
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
                color: Colors.black26,
              ),
              Text(
                'ชื่อฟาร์ม: ${Auth.farmer.farmName}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              Text(
                'พื้นที่ฟาร์ม: ${Auth.farmer.farmMaxArea} ตร.ม.',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              Text(
                'เบอร์โทรติดต่อ: ${Auth.farmer.contact}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
              Text(
                'ที่อยู่: ${Auth.farmer.address}',
                textAlign: TextAlign.left,
                style: kNormalTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
