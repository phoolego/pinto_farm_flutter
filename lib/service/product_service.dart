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
      List<ProductType> productType = (response.data as List).map((productType) => ProductType(
          productType
      )).toList();
      return productType;
    } on DioError catch (err) {
      return err.response!.data['message'];
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<List<String>> getProductTypeName() async{
    try {
      List<ProductType> productType = await getAllProductType();
      List<String> nameList =  productType.map((type) => type.name).toList();
      return nameList;
    } on DioError catch (err) {
      return err.response!.data['message'];
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }

  static Future<List<Map>> getAllProduct() async{
    try{
      var response = await Api.dio.get('/farmer-product',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
      );
      List<Map> products = (response.data as List).map((product) => {
        'productId':product['product_id'],
        'plantDate':DateTime.parse(product['plant_date']),
        'name':product['type_of_product'],
        'status':product['status']
      }).toList();
      return products;
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<Product> getProductDetail(int productId) async{
    try{
      var response = await Api.dio.get('/farmer-product/detail',
        queryParameters: {
          'productId':productId
        },
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
      );
      Product product = Product(response.data);
      return product;
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<void> insertProduct(String productType,double area, DateTime plantDate, DateTime predictHarvestDate, double predictAmount) async{
    try{
      await Api.dio.post('/farmer-product/insert',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
        data: {
          'productType':productType,
          'area':area,
          'plantDate':plantDate.toString().substring(0,10),
          'predictHarvestDate':predictHarvestDate.toString().substring(0,10),
          'predictAmount':predictAmount
        },
      );
    } on DioError catch (err) {
      if(err.response!.data['message']=='not enough area'){
        throw 'ฟาร์มของคุณเหลือพื้นที่ไม่มากพอ';
      }else{
        throw 'เกิดข้อผิดพลาด';
      }
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }
  static Future<void> harvestProduct(int productId, DateTime harvestDate, double harvestAmount) async{
    try{
      await Api.dio.put('/farmer-product/harvest',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
        data: {
          'productId':productId,
          'harvestDate':harvestDate.toString().substring(0,10),
          'harvestAmount':harvestAmount,
        },
      );
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }
}