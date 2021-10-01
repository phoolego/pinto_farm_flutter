import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/product_type.dart';
import 'package:pinto_farmer_flutter/screen/product_edit_details_page.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';

class AddProductPage extends StatelessWidget {
  // late ProductType productType;
  // AddProductPage({required this.product});
  // bool _isNull(dynamic value) {
  //   return value == null;
  // }
  String unitAmount = 'กก.';
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      helpText: 'เลือกวันที่',
      cancelText: 'ยกเลิก',
      confirmText: 'ตกลง',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    //size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          'เพิ่มผลิตภัณฑ์',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
          child: Stack(alignment: Alignment.topCenter, fit: StackFit.expand, children: [
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 0.01 * screenHeight),
                      padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.8 * screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ชื่อผลิตภัณฑ์', style: kNormalTextStyle),
                                TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.8 * screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('พื้นที่ปลูก', style: kNormalTextStyle),
                                TextField(
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.8 * screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('วันที่เริ่มปลูก', style: kNormalTextStyle),
                                Container(
                                  width: 0.9 * screenWidth,
                                  height: 0.05 * screenHeight,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: lightBlack),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () => _selectDate(context),
                                    child: Text(
                                      "${DateFormat.getFullDate(selectedDate.toLocal())}".split(' ')[0],
                                      style: kNormalTextStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.8 * screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('วันที่คาดว่าจะเก็บเกี่ยว', style: kNormalTextStyle),
                                Container(
                                  width: 0.9 * screenWidth,
                                  height: 0.05 * screenHeight,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: lightBlack),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () => _selectDate(context),
                                    child: Text(
                                      "${DateFormat.getFullDate(selectedDate.toLocal())}".split(' ')[0],
                                      style: kNormalTextStyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.8 * screenWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ปริมาณที่คาดว่าจะเก็บเกี่ยว', style: kNormalTextStyle),
                                TextField(
                                  obscureText: false,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.005 * screenHeight),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0.005 * screenWidth, 0.002 * screenHeight,
                                        0.005 * screenWidth, 0.002 * screenHeight),
                                    child: Text('เพิ่มรูปภาพ', style: blackSmallNormalTextStyle)),
                                style: ElevatedButton.styleFrom(primary: lightGrayBackground),
                                onPressed: () {
                                  print('Pressed');
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 0.5 * screenWidth,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0.005 * screenHeight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0.01 * screenWidth, 0.005 * screenHeight,
                                        0.01 * screenWidth, 0.005 * screenHeight),
                                    child: Text('เพิ่มผลิตภัณฑ์', style: whiteSmallNormalTextStyle)),
                                style: ElevatedButton.styleFrom(primary: deepOrange),
                                onPressed: () {
                                  print('Pressed');
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
