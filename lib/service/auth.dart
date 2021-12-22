import 'package:pinto_farmer_flutter/api/api.dart';
import 'package:dio/dio.dart';
import 'package:pinto_farmer_flutter/model/farmer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Ss;

class Auth {
  static const _storage = Ss.FlutterSecureStorage();
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
      if(err.response==null){
        throw 'การเชื่อมต่อขัดข้อง';
      }else if(err.response!.statusCode==403){
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
    }
  }
  static Future<void> logout() async{
    farmer = Farmer.notLogin();
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'password');
  }
  static Future<int> register(String firstname,String lastname,String email,String password,String address,String contact,String farmName,double maxArea) async {
    try {
      var response = await Api.dio.post('/register-farmer',
        data:{
          'firstname':firstname,
          'lastname':lastname,
          'email':email,
          'password':password,
          'address':address,
          'contact':contact,
          'farmName': farmName,
          'maxArea': maxArea
        }
      );
      return response.data['user_id'];
    } on DioError catch (err) {
      print(err.response!.data['message']);
      if(err.response==null){
        throw 'การเชื่อมต่อขัดข้อง';
      }else if(err.response!.data['message']=='this email was used'){
        throw 'อีเมลนี้ถูกใช้ไปแล้ว';
      }else if(err.response!.data['message']=='this farm name was used'){
        throw 'ชื่อฟาร์มนี้ถูกใช้ไปแล้ว';
      }else{
        throw 'ระบบขัดข้อง';
      }
    } catch (err){
      print(err);
      throw 'เกิดข้อผิดพลาด';
    }
  }
  static Future<int> requestRole(String email,String password,String farmName,double maxArea) async {
    try {
      var response = await Api.dio.post('/request-farmer-role',
        data:{'email':email,'password':password,'farmName':farmName,'maxArea':maxArea}
      );
      return response.data['insertId'];
    } on DioError catch (err) {
      if(err.response==null){
        throw 'การเชื่อมต่อขัดข้อง';
      }else if(err.response!.statusCode==403){
        throw 'กรุณากรอกข้อมูลให้ครบถ้วน';
      }else if(err.response!.data['message']=='wrong password'){
        throw 'รหัสผ่านไม่ถูกต้อง';
      }else if(err.response!.data['message']=='you already have farmer permission'){
        throw 'คุณสิทธิ์การเข้าใช้งานแบบเกษตรกรอยู่แล้ว';
      }else if(err.response!.data['message']=='wait for request response'){
        throw 'รอการอนุมัติสิทธิ์';
      }
      else if(err.response!.data['message']=='no user found'){
        throw 'ไม่พบบัญชีผู้ใช้';
      }else{
        throw 'ระบบขัดข้อง';
      }
    } catch (err){
      throw 'เกิดข้อผิดพลาด';
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
  static Future<void> updateFarmer(String farmName, double maxArea, String firstname, String lastname, String address, String contact) async{
    try {
      var response = await Api.dio.put('/update-farmer',
        data:{
          'farmName':farmName,
          'maxArea':maxArea,
          'firstname':firstname,
          'lastname':lastname,
          'address':address,
          'contact':contact,
          'userId':farmer.userId,
        },
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
          },
        ),
      );
      farmer = Farmer(response.data);
    } on DioError catch (err) {
      if(err.response==null){
        throw 'การเชื่อมต่อขัดข้อง';
      }else if(err.response!.statusCode==403){
        throw 'กรุณากรอกข้อมูลให้ครบถ้วน';
      }else{
        throw 'ระบบขัดข้อง';
      }
    } catch (err){
      throw 'เกิดข้อผิดพลาด';
    }
  }
}