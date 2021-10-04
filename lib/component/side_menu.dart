
import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

class SideMenu extends StatelessWidget {

String? firstName = '';
String? lastName = '';
SideMenu.withoutAny(){
  this.firstName = Auth.farmer.firstname;
  this.lastName = Auth.farmer.lastname;
}
SideMenu({this.firstName, this.lastName});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/Icons.jpg'),
                    ),
                    Text(
                      '$firstName \n$lastName',
                      textAlign: TextAlign.left,
                      style: kNormalTextStyle,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('รายการผลิตภัณฑ์',style: kNormalTextStyle),
              onTap: (){
                print('${Auth.farmer.firstname} เข้าสู่หน้ารายการผลิตภัณฑ์');
                Navigator.pushNamed(context, '/product',);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.list),
            //   title: Text('รายการที่ส่งขาย'),
            //   onTap: (){
            //     print('$firstName เข้าสู่หน้ารายการที่ส่งขาย');
            //     Navigator.pushNamed(context, '/product/sale',);
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('โปรไฟล์ของฉัน',style: kNormalTextStyle),
              onTap: (){
                print('${Auth.farmer.firstname} เข้าสู่หน้าโปรไฟล์ของฉัน');
                Navigator.pushNamed(context, '/profile',);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ',style: kNormalTextStyle),
              onTap: ()async {
                print('${Auth.farmer.firstname} ออกจากระบบ');
                await Auth.logout();
                Navigator.pushReplacementNamed(context,'/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
