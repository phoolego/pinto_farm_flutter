import 'package:pinto_farmer_flutter/api/api.dart';
import 'package:dio/dio.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/model/product_type.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';

class ProductService{
  static Future<List<ProductType>> getAllProductType() async{
    try {
      var response = await Api.dio.get('/product-type',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId
          },
        ),
      );
      List<ProductType> productType =  (response.data as List).map((productType) => ProductType(
          productType
      )).toList();
      return productType;
    } on DioError catch (err) {
      return err.response!.data['message'];
    }
  }
  static Future<List<Product>> getAllProduct() async{
    try{
      var response = await Api.dio.get('/farmer-product',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
      );
      List<Product> products =  (response.data as List).map((product) => Product(
          product
      )).toList();
      // print(products[0]);
      return products;
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }
}