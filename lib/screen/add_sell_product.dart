import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/screen/farmer_product_sell_page.dart';
import 'package:pinto_farmer_flutter/service/product_service.dart';

class AddSellProductPage extends StatefulWidget {
  Product product;
  AddSellProductPage({required this.product});

  @override
  State<AddSellProductPage> createState() => _AddSellProductPageState();
}

class _AddSellProductPageState extends State<AddSellProductPage> {
  final _formKey = GlobalKey<FormState>();
  double sspAmount=0;
  double productPrice = 0.00;
  String _errorMessage ='';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: Text(
          'เพิ่มรายการ',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        alignment: Alignment.topCenter,
        //color: deepGrayBackground,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ปริมาณที่จะส่งขาย',
                      style: kHeadingTextStyle,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(fontSize: 18.0, fontFamily: 'Prompht'),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return 'กรุณากรอกปริมาณที่เก็บเกี่ยว';
                              }else if(num.tryParse(value)==null || double.parse(value)<=0){
                                return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                              }else{
                                return null;
                              }
                            },
                            onChanged: (value){
                              if(num.tryParse(value)!=null && double.parse(value)>0){
                                setState(() {
                                  sspAmount=double.parse(value);
                                  productPrice=sspAmount*widget.product.buyPrice;
                                });
                              }else{
                                setState(() {
                                  productPrice=0;
                                });
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            widget.product.unit,
                            style: kContentTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'เป็นราคา',
                          style: kContentTextStyle,
                        ),
                        Text(
                          '$productPrice',
                          style: kContentTextStyle,
                        ),
                        Text(
                          'บาท',
                          style: kContentTextStyle,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight*0.05),
                    child: PintoButton(
                      width: 200,
                      label: 'บันทึกข้อมูล',
                      function: () async{
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            _errorMessage = '';
                          });
                          try{
                            await ProductService.insertStockProduct(widget.product.productId,sspAmount,productPrice);
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FarmerProductSale(product: widget.product)
                              ),
                            );
                          }catch(err){
                            setState(() {
                              _errorMessage = err.toString();
                            });
                          }
                        }
                      },
                      buttonColor: deepOrange,
                    ),
                  ),
                  Text(_errorMessage,style: kErrorTextStyle,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
