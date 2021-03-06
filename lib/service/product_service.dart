import 'dart:io';

import 'package:pinto_farmer_flutter/api/api.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pinto_farmer_flutter/model/product.dart';
import 'package:pinto_farmer_flutter/model/product_type.dart';
import 'package:pinto_farmer_flutter/model/stock_product.dart';
import 'package:pinto_farmer_flutter/service/auth.dart';
import 'package:pinto_farmer_flutter/service/thai_sort.dart';

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
      productType.sort((a,b)=> ThaiSort.compareTo(a.name, b.name));
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
      nameList.sort((a,b)=> ThaiSort.compareTo(a, b));
      return nameList;
    } on DioError catch (err) {
      return err.response!.data['message'];
    }catch(err){
      print(err.toString());
      throw err.toString();
    }
  }

  static Future<List<ProductPreview>> getAllProduct() async{
    try{
      var response = await Api.dio.get('/farmer-product',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
      );
      List<ProductPreview> products = (response.data as List).map((product) => ProductPreview(product)).toList();
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
  static Future<void> updateProductImg(int productId,File img) async{
    try{
      String fileName = img.path.split('/').last;
      FormData formData = FormData.fromMap({
        'productId':productId,
        'productPic':await MultipartFile.fromFile(img.path, filename:fileName,contentType: MediaType('image', fileName.split('.').last))
      });
      await Api.dio.put('/farmer-product/update-pic',
        data: formData,
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
          contentType: 'multipart/form-data',
        ),
      );
    } on DioError catch (err) {
      if(err.response!=null){
        throw err.response.toString();
      }else{
        throw err.message;
      }
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
        throw '?????????????????????????????????????????????????????????????????????????????????????????????';
      }else{
        throw '??????????????????????????????????????????';
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
      throw err.toString();
    }
  }
  static Future<void> disposeProduct(int productId) async{
    try{
      await Api.dio.put('/farmer-product/dispose',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
        data: {
          'productId':productId,
        },
      );
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }catch(err){
      throw err.toString();
    }
  }
  static Future<List<StockProduct>> getStockProduct(int productId) async{
    try{
      var response = await Api.dio.get('/send-stock-product',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
        queryParameters: {
          'productId':productId
        },
      );
      List<StockProduct> stockProducts = (response.data as List).map((stockProduct) => StockProduct(
          stockProduct
      )).toList();
      return stockProducts;
    } on DioError catch (err) {
      throw err.response!.data['message'];
    }catch(err){
      throw err.toString();
    }
  }
  static Future<void> insertStockProduct(int productId,double sspAmount, double sspPrice) async{
    try{
      await Api.dio.post('/send-stock-product/insert',
        options: Options(
          headers: {
            'userId':Auth.farmer.userId,
            'farmerId':Auth.farmer.farmId,
          },
        ),
        data: {
          'productId':productId,
          'sspAmount':sspAmount,
          'sspPrice':sspPrice
        },
      );
    } on DioError catch (err) {
      if(err.response!.data['message']=='This product does not have enough number to send'){
        throw '???????????????????????????????????????????????????????????????????????????';
      }else if(err.response!.data['message']=='This product is not available'){
        throw '??????????????????????????????????????????????????????????????????????????????????????????';
      }
    }catch(err){
      throw err.toString();
    }
  }
}