import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/product_list_card.dart';
import 'package:pinto_farmer_flutter/component/side_menu.dart';
import 'package:pinto_farmer_flutter/screen/product_details_page.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';
import 'package:pinto_farmer_flutter/service/product_service.dart';

class ProductListPage extends StatelessWidget {
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
                  Text('สวัสดี,\nฟาร์ม ${Auth.farmer.farmName}', style: kHeadingTextStyle)
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          style:
                              kNormalTextStyle,
                          decoration: const InputDecoration(
                            hintText: 'ค้นหาผลิตภัณฑ์',
                            hintStyle: kNormalTextStyle,
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
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
                  height: 5,
                ),
                PintoButton(
                  width: 150,
                  label: '+เพิ่มผลิตภัณฑ์',

                  function: () {
                    Navigator.pushNamed(context, '/product/add');
                    print('เข้าสู่หน้าเพิ่มผลิตภัณฑ์');
                  },
                  buttonColor: lightOrange
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List<Map>>(
                future: ProductService.getAllProduct(),
                builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot){
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Map>? products = snapshot.data;
                    return ListView.builder(
                      itemCount: products!.length,
                      itemBuilder:(context, index) => ProductCard.withoutProductID(
                          productName: products[index]['name'],
                          dateString: DateFormat.getFullDate(products[index]['plantDate']),
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductDetailsPage(productId: products[index]['productId'],))
                            );
                          },
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
