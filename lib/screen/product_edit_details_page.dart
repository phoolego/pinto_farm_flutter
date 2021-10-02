import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';
import 'package:pinto_farmer_flutter/screen/product_details_page.dart';
import 'package:pinto_farmer_flutter/service/product_service.dart';

class ProductEditDetailsPage extends StatefulWidget {
  Product product;

  ProductEditDetailsPage({required this.product});

  @override
  State<ProductEditDetailsPage> createState() => _ProductEditDetailsPageState();
}

class _ProductEditDetailsPageState extends State<ProductEditDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime _harvestDate = DateTime.now();
  double _harvestAmount = 0;

  String _errorHarvestDate = '';
  String _errorMessage = '';
  _selectDate(BuildContext context,DateTime selectedDate,void Function(DateTime pick) setDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: widget.product.plantDate,
      lastDate: DateTime(DateTime.now().year+1,DateTime.now().month,DateTime.now().day),
      helpText: 'เลือกวันที่',
      cancelText: 'ยกเลิก',
      confirmText: 'ตกลง',
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        setDate(picked);
      });
    }
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
          '${widget.product.typeOfProduct}',
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
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight-kToolbarHeight-MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(color: deepGrayBackground),
            child: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: 0.35 * screenHeight,
                    constraints: BoxConstraints(
                      minWidth: screenWidth,
                    ),
                    alignment: AlignmentDirectional.topCenter,
                    child: Image.asset(
                      'assets/images/white_cabbage.jpg',
                    ),
                  ),
                ),
                Positioned(
                  top: 0.3 * screenHeight,
                  child: Container(
                    height: screenHeight * 0.7 - MediaQuery.of(context).padding.top - kToolbarHeight,
                    width: screenWidth,
                    padding: EdgeInsets.fromLTRB(
                        0.04 * screenWidth, 0.01 * screenHeight, 0.04 * screenWidth, 0.01 * screenHeight),
                    // alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: deepWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 0.01 * screenHeight),
                          padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
                          decoration: BoxDecoration(
                            color: lightGrayBackground,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('พื้นที่การปลูก', style: kNormalTextStyle),
                                        Text('${widget.product.area} ${widget.product.areaUnit}', style: kNormalTextStyle)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 0.43 * screenWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('วันที่เริ่มปลูก', style: kNormalTextStyle),
                                        Text(DateFormat.getFullDate(widget.product.plantDate), style: kNormalTextStyle)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Container(
                            margin: EdgeInsets.only(top: 0.01 * screenHeight),
                            decoration: BoxDecoration(
                              color: deepWhite,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 0.9 * screenWidth,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('วันที่เก็บเกี่ยว', style: kNormalTextStyle),
                                      Container(
                                        width: 0.9 * screenWidth,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: lightBlack),
                                          borderRadius: BorderRadius.all(Radius.circular(5),),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                        child: InkWell(
                                          onTap: () => _selectDate(context,_harvestDate,(pick){_harvestDate=pick;}),
                                          child: Text(
                                            "${DateFormat.getFullDate(_harvestDate.toLocal())}".split(' ')[0],
                                            style: kNormalTextStyle,
                                          ),
                                        ),
                                      ),
                                      _errorHarvestDate.isEmpty?SizedBox():Text(_errorHarvestDate,style: TextStyle(color: Colors.red),),
                                      SizedBox(height: 0.02 * screenHeight,),
                                      Text('ปริมาณที่เก็บเกี่ยว (${widget.product.unit})', style: kNormalTextStyle),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                        ),
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return 'กรุณากรอกปริมาณที่เก็บเกี่ยว';
                                          }else if(num.tryParse(value)==null || double.parse(value)<=0){
                                            return 'กรุณากรอกพตัวเลขที่ถูกต้อง';
                                          }else{
                                            return null;
                                          }
                                        },
                                        onChanged: (value){
                                          if(num.tryParse(value)!=null && double.parse(value)>0){
                                            _harvestAmount=double.parse(value);
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*0.05,),
                        Container(
                          padding: EdgeInsets.only(top: 0.01 * screenHeight),
                          child: Column(
                            children: [
                              PintoButton(
                                width: 200,
                                label: 'ยืนยันแก้ไขข้อมูล',
                                function: () async{
                                  setState(() {
                                    _errorHarvestDate='';
                                  });
                                  if(_harvestDate.compareTo(widget.product.plantDate)<0){
                                    setState(() {
                                      _errorHarvestDate='ไม่สามารถเก็บเกี่ยวก่อนวันปลูกได้';
                                    });
                                  }else if (_formKey.currentState!.validate()) {
                                    try{
                                      await ProductService.harvestProduct(widget.product.productId, _harvestDate, _harvestAmount);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ProductDetailsPage(productId: widget.product.productId,))
                                      );
                                    }catch(err){
                                      setState(() {
                                        _errorMessage = err.toString();
                                      });
                                    }
                                  }
                                },
                                buttonColor: deepOrange,
                                textStyle: whiteSmallNormalTextStyle,
                              ),
                              // ElevatedButton(
                              //   child: Padding(
                              //       padding: EdgeInsets.fromLTRB(0.01 * screenWidth, 0.005 * screenHeight,
                              //           0.01 * screenWidth, 0.005 * screenHeight),
                              //       child: Text('ยืนยันแก้ไขข้อมูล', style: whiteSmallNormalTextStyle)),
                              //   style: ElevatedButton.styleFrom(primary: deepOrange),
                              //   onPressed: () {
                              //     print('Pressed');
                              //   },
                              // )
                            ],
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
