import 'package:pinto_farmer_flutter/api/api.dart';
import 'package:dio/dio.dart';
import 'package:pinto_farmer_flutter/model/farmer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth {
  static final _storage = FlutterSecureStorage();
  static Farmer farmer = Farmer.notLogin();

  static Future<Farmer> login(String? email,String? password) async {
    try {
      var response = await Api.dio.post('/login-email-farmer',
          data:{'email':email,'password':password}
      );
      farmer = Farmer(response.data);
      await _storage.write(key: 'email', value: email);
      await _storage.write(key: 'password', value: password);
      return Farmer(response.data);
    } on DioError catch (err) {
      if(err.response!.statusCode==403){
        throw 'กรุณากรอก อีเมล และ รหัสผ่าน';
      }else if(err.response!.data['message']=='wrong password'){
        throw 'รหัสผ่านไม่ถูกต้อง';
      }else if(err.response!.data['message']=='Do not have permission'){
        throw 'คุณไม่มีสิทธิ์ในการเข้าใช้งาน';
      }else if(err.response!.data['message']=='no user found'){
        throw 'ไม่พบบัญชีผู้ใช้';
      }else{
        throw 'ระบบขัดข้อง';
      }
      // print(err.response!.statusCode);
      // print(err.response!.data['message']);
    }
  }
  static Future<void> logout() async{
    farmer = Farmer.notLogin();
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'password');
  }
  static Future<int> register(String username,String email,String password,String address,String contact) async {
    try {
      var response = await Api.dio.post('/insert-farmer',
        data:{
          'username':username,
          'email':email,
          'password':password,
          'address':address,
          'contact':contact,
          'role':'FARMER'
        }
      );
      return response.data['insertId'];
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }
  }
  static Future<Farmer> getLoginUser() async{
    if(farmer.userId!=0){
      return farmer;
    }else{
      Map<String, String> userData = await _storage.readAll();
      if(userData['email']!=null && userData['password']!=null){
        return await login(userData['email'], userData['password']);
      }else{
        return Farmer.notLogin();
      }
    }

  }
}