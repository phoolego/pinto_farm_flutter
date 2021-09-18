import 'package:pinto_farmer_flutter/api/api.dart';
import 'package:dio/dio.dart';
import 'package:pinto_farmer_flutter/model/product_type.dart';

class ProductService{
  static getAllProductType() async{
    try {
      var response = await Api.dio.get('/product-type',
        options: Options(
          headers: {
            'userId':13
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
}