import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinto_farmer_flutter/component/pinto_text_field.dart';
import 'package:pinto_farmer_flutter/constant.dart';
import 'package:pinto_farmer_flutter/component/pinto_button.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

class RegisterFarmerPage extends StatefulWidget {
  @override
  _RegisterFarmerPageState createState() => _RegisterFarmerPageState();
}

class _RegisterFarmerPageState extends State<RegisterFarmerPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String firstname = '';
  String lastname = '';
  String address = '';
  String contact = '';
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
          'สร้างบัญชีใหม่ในระบบ',
          style: kAppbarTextStyle,
        ),
      ),
      body: _success?Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            children:[
              const Text('การสร้างบัญชีเสร็จสิ้น กรุณารอการยืนยันจากผู้ดูแลระบบก่อนเริ่มต้นใช้งาน'),
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
                initValue: email,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'กรุณากรอกอีเมล';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  email = val;
                },
              ),
              PintoTextField(
                label: 'รหัสผ่าน',
                isPassword: true,
                initValue: password,
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
                label: 'ยืนยันรหัสผ่าน',
                isPassword: true,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'กรุณากรอกรหัสผ่าน';
                  } else if(val!=password){
                    return 'รหัสผ่านไม่ตรงกัน';
                  }else {
                    return null;
                  }
                },
                onChanged: (val) {
                },
              ),
              PintoTextField(
                label: 'ชื่อ',
                initValue: firstname,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'กรุณากรอกชื่อ';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  firstname = val;
                },
              ),
              PintoTextField(
                label: 'นามสกุล',
                initValue: lastname,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return 'กรุณากรอกนามสกุล';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  lastname = val;
                },
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'ที่อยู่',
                        style: kContentTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: TextFormField(
                        initialValue: address,
                        minLines: 3,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'กรุณากรอกที่อยู่';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          address = val;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'เบอร์โทรศัพท์ที่ติดต่อได้',
                        style: kContentTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        initialValue: contact,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'กรุณากรอกเบอร์โทรศัพท์ที่ติดต่อได้';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          contact = val;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              PintoTextField(
                label: 'ชื่อฟาร์ม',
                initValue: farmName,
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
                initValue: maxArea.toString(),
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
                      await Auth.register(firstname,lastname,email,password,address,contact,farmName,maxArea);
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
                width: 200,
              ),
              Text(_errorMessage,style: const TextStyle(color: Colors.red),),
              SizedBox(
                height: screenHeight * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
