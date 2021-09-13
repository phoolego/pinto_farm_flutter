import 'package:flutter/material.dart';
import 'package:pinto_flutter/component/pinto_button.dart';
import 'package:pinto_flutter/constant.dart';
import 'package:pinto_flutter/component/productListCard.dart';
import 'package:pinto_flutter/component/SideMenu.dart';

class productListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideMenu.withoutAny(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 154, 0),
        title: Text(
          'รายการผลิตภัณฑ์',
          style: kAppbarTextStyle,
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.menu),
        // ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('สวัสดี,\nฟาร์ม สมหญิง', style: kHeadingTextStyle)
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontSize: 18.0, fontFamily: 'Prompht'),
                          decoration: const InputDecoration(
                            hintText: 'ค้นหาผลิตภัณฑ์',
                            hintStyle: TextStyle(fontFamily: 'Prompht'),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ), // icon is 48px widget.
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PintoButton(
                    width: screenWidth * 0.5,
                    label: '+ เพิ่มผลิตภัณฑ์',
                    function: () {},
                    buttonColor: Colors.amber)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  ProductCard.withoutProductID(
                      productName: 'ชื่อผลิตภัณฑ์',
                      dateString: '10/10/2021'),
                  ProductCard.withoutProductID(
                      productName: 'productName',
                      dateString: 'dateString'),
                  ProductCard.withoutProductID(
                      productName: 'productName',
                      dateString: 'dateString'),
                  ProductCard.withoutProductID(
                      productName: 'productName',
                      dateString: 'dateString'),
                  ProductCard.withoutProductID(
                      productName: 'productName',
                      dateString: 'dateString'),
                  ProductCard.withoutProductID(
                      productName: 'productName',
                      dateString: 'dateString'),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


