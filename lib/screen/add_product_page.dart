import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinto_farmer_flutter/component/drop_down_field.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/model/product_type.dart';
import 'package:pinto_farmer_flutter/service/date_format.dart';
import 'package:pinto_farmer_flutter/service/product_service.dart';

class AddProductPage extends StatefulWidget {
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  String _unitAmount = 'กก.';
  final String _unitArea = 'ตร.ม';
  String _productType='';
  double _area=0;
  DateTime _plantDate = DateTime.now();
  DateTime _predictHarvestDate = DateTime.now();
  double _predictAmount = 0;

  String _errorProductType = '';
  String _errorMessage = '';
  _selectDate(BuildContext context,DateTime selectedDate,void Function(DateTime pick) setDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
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
        title: const Text(
          'เพิ่มผลิตภัณฑ์',
          style: kAppbarTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 0.01 * screenHeight, bottom: 0.01 * screenHeight),
          child: Stack(alignment: Alignment.topCenter, fit: StackFit.expand, children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                            SizedBox(
                              width: 0.8 * screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ชื่อผลิตภัณฑ์', style: kNormalTextStyle),
                                  FutureBuilder<List<String>>(
                                    future: ProductService.getProductTypeName(),
                                    builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                                      if (!snapshot.hasData) {
                                        return DropDownField(items: []);
                                      } else {
                                        List<String>? productType = snapshot.data;
                                        return DropDownField(
                                          items: productType!,
                                          onChange: (value)async{
                                            _productType=value;
                                            _unitAmount = ProductType.getUnit(await ProductService.getAllProductType(), value);
                                          },
                                        );
                                      }
                                    },
                                  ),
                                  _errorProductType.isEmpty?SizedBox():Text(_errorProductType,style: TextStyle(color: Colors.red),),
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
                            SizedBox(
                              width: 0.8 * screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('พื้นที่ปลูก', style: kNormalTextStyle),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixText: _unitArea,
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'กรุณากรอกพื้นที่ปลูก';
                                      }else if(num.tryParse(value)==null || double.parse(value)<=0){
                                        return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                                      }else{
                                        return null;
                                      }
                                    },
                                    onChanged: (value){
                                      if(num.tryParse(value)!=null && double.parse(value)>0){
                                        _area=double.parse(value);
                                      }
                                    },
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
                                  width: 0.8 * screenWidth,
                                  height: 50 ,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: lightBlack),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  child: InkWell(
                                    onTap: () => _selectDate(context,_plantDate,(pick){_plantDate=pick;}),
                                    child: Text(
                                      DateFormat.getFullDate(_plantDate.toLocal()).split(' ')[0],
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
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: lightBlack),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                  child: InkWell(
                                    onTap: () => _selectDate(context,_predictHarvestDate,(pick){_predictHarvestDate=pick;}),
                                    child: Text(
                                      DateFormat.getFullDate(_predictHarvestDate.toLocal()).split(' ')[0],
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
                            SizedBox(
                              width: 0.8 * screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ปริมาณที่คาดว่าจะเก็บเกี่ยว', style: kNormalTextStyle),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      suffixText: _unitAmount,
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'กรุณากรอกปริมาณที่คาดว่าจะเก็บเกี่ยว';
                                      }else if(num.tryParse(value)==null || double.parse(value)<=0){
                                        return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                                      }else{
                                        return null;
                                      }
                                    },
                                    onChanged: (value){
                                      if(num.tryParse(value)!=null && double.parse(value)>0){
                                        _predictAmount=double.parse(value);
                                      }
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0.01 * screenHeight),
                        child: Column(
                          children: [
                            PintoButton(
                              width: 200,
                              label: 'เพิ่มผลิตภัณฑ์',
                              function: () async{
                                setState(() {
                                  _errorProductType='';
                                });
                                if(_productType.isEmpty){
                                  setState(() {
                                    _errorProductType='กรุณาเลือกผลิตภัณฑ์';
                                  });
                                }else if (_formKey.currentState!.validate()) {
                                  try{
                                    await ProductService.insertProduct(_productType, _area, _plantDate, _predictHarvestDate, _predictAmount);
                                    Navigator.pop(context);
                                    Navigator.pushReplacementNamed(context, '/product');
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
                            //       child: const Text('เพิ่มผลิตภัณฑ์', style: whiteSmallNormalTextStyle)
                            //   ),
                            //   style: ElevatedButton.styleFrom(primary: deepOrange),
                            //   onPressed: () async{
                            //     setState(() {
                            //       _errorProductType='';
                            //     });
                            //     if(_productType.isEmpty){
                            //       setState(() {
                            //         _errorProductType='กรุณาเลือกผลิตภัณฑ์';
                            //       });
                            //     }else if (_formKey.currentState!.validate()) {
                            //       try{
                            //         await ProductService.insertProduct(_productType, _area, _plantDate, _predictHarvestDate, _predictAmount);
                            //         Navigator.pop(context);
                            //         Navigator.pushReplacementNamed(context, '/product');
                            //       }catch(err){
                            //         setState(() {
                            //           _errorMessage = err.toString();
                            //         });
                            //       }
                            //     }
                            //   },
                            // ),
                            Text(_errorMessage,style: TextStyle(color: Colors.red),),
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
