import 'package:flutter/material.dart';
import 'package:pinto_flutter/component/pinto_button.dart';
import 'package:pinto_flutter/constant.dart';


class productListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 154, 0),
        title: Text(
          'รายการผลิตภัณฑ์',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.menu),
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
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ))),
                        ),
                      ),
                    ],
                  ),
                ),
                PintoButton(
                    label: '+ เพิ่มผลิตภัณฑ์',
                    function: (){},
                    buttonColor: Colors.amber)


              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(

              child: ListView(children: [
               ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 500,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  height:80,
                  child: Image.asset('assets/images/Demo.PNG'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
