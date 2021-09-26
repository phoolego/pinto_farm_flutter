import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/productListCard.dart';
import 'package:pinto_farmer_flutter/component/side_menu.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/screen/product_details_page.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';
import 'package:pinto_farmer_flutter/service/date_farmat.dart';
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
                  buttonColor: Colors.amber
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: ProductService.getAllProduct(),
                builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot){
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<Product>? products = snapshot.data;
                    return ListView.builder(
                      itemCount: products!.length,
                      itemBuilder:(context, index) => ProductCard.withoutProductID(
                          productName: products[index].typeOfProduct,
                          dateString: DateFormat.getFullDate(products[index].plantDate),
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductDetailsPage(product: products[index],))
                            );
                          },
                      ),
                    );
                    // return ListView(
                    //   children: [
                    //     ProductCard.withoutProductID(
                    //       productName: 'ชื่อผลิตภัณฑ์',
                    //       dateString: '10/10/2021',
                    //       function: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage()));
                    //       },
                    //     ),
                    //   ],
                    // );
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
