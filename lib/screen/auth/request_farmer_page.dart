import 'package:flutter/material.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/pinto_text_field.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

class RequestFarmerPage extends StatefulWidget {
  @override
  _RequestFarmerPageState createState() => _RequestFarmerPageState();
}

class _RequestFarmerPageState extends State<RequestFarmerPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String farmName = '';
  double maxArea = 0;
  String _errorMessage = '';
  bool _loading = false;
  bool _success = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrange,
        title: const Text(
          'ขอสิทธิ์เป็นเกษตรบางกะเจ้า',
          style: kAppbarTextStyle,
        ),
      ),
      body: _success?Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children:[
            const Text('ขอรับสิทธิ์เสร็จสิ้น กรุณารอการยืนยันจากผู้ดูแลระบบก่อนเริ่มต้นใช้งาน'),
            const SizedBox(height: 10,),
            PintoButton(label: 'กลับหน้าแรก', function: (){Navigator.pushReplacementNamed(context, '/');}, buttonColor: deepOrange)
          ]
        ),
      ):
      _loading?const Center(child: Text('กำลังขอสิทธิ์')):
      SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              PintoTextField(
                label: 'อีเมล',
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'กรุณากรอกอีเมล';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  email=val;
                },
              ),
              PintoTextField(
                label: 'รหัสผ่าน',
                isPassword: true,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'กรุณากรอกรหัสผ่าน';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  password = val;
                },
              ),
              PintoTextField(
                label: 'ชื่อฟาร์ม',
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'กรุณากรอกชื่อฟาร์ม';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  farmName=val;
                },
              ),
              PintoTextField(
                label: 'ขนาดฟาร์ม (ตร.ม.)',
                validator: (String? val) {
                  if(val!.isEmpty){
                    return 'กรุณากรอกพื้นที่ปลูก';
                  }else if(num.tryParse(val)==null || double.parse(val)<=0){
                    return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                  }else{
                    return null;
                  }
                },
                onChanged: (val) {
                  if(num.tryParse(val)!=null && double.parse(val)>0){
                    maxArea=double.parse(val);
                  }
                },
              ),
              PintoButton(
                label: 'บันทึกข้อมูล',
                function: () async {
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      _loading = true;
                    });
                    try{
                      await Auth.requestRole(email,password,farmName,maxArea);
                      setState(() {
                        _success = true;
                        _loading = false;
                      });
                    }catch(err){
                      setState(() {
                        _errorMessage = err.toString();
                        _loading = false;
                      });
                    }
                  }
                },
                buttonColor: deepOrange,
              ),
              Text(_errorMessage,style: const TextStyle(color: Colors.red),),
              SizedBox(
                height: screenHeight * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
