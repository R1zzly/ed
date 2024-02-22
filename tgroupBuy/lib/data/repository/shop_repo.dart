import 'package:tgroupbuy/data/models/product.dart';
import '../../common/error/exceptions.dart';
import '../../utils/api_constants.dart';
import 'package:dio/dio.dart';

import 'header_gen.dart';

abstract class ShopRepo {
  Future<Product> addProduct(String name, int price, String category,
      int rating, String image);
  Future<List<Product>> productView();
  Future <List<Product>> productSearch(String name);
  Future <List<Product>> sortByRatingdesc();
  Future<void> addToCart({required String userId,required  String productId,required String token});
  Future<List<Product>> getCart({required String token,required String userId});
}

class ShopRepoImpl implements ShopRepo {
  final Dio _dio;
  final HeaderGen _gen;
  ShopRepoImpl(this._dio, this._gen);

  @override
  Future<Product> addProduct(String name, int price, String category,
      int rating, String image) async {
    try {
      final headers = _gen.getHeader();
      final response = await _dio.post(
        '$API_BASE_URL/admin/addproduct',
        data: {
          'product_name': name,
          'price': price,
          'category': category,
          'rating': rating,
          'image': image,
        },
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }

      return Product.fromJson(response.data);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  @override
  Future <List<Product>> productView() async {
    try {
      final headers = _gen.getHeader();
      final response = await _dio.get(
        '$API_BASE_URL/users/productview',
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }
      List<Product> productList = (response.data as List)
          .map((productJson) => Product.fromMap(productJson))
          .toList();
      return productList;
    } on ApiException {
      rethrow;
    }on DioException catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  @override
  Future <List<Product>> productSearch(String name) async {
    try {
      final headers = _gen.getHeader();
      final response = await _dio.get(
        '$API_BASE_URL/users/search',
        queryParameters: {'name': name},
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }
      List<Product> productList = [];
      if(response.data != null ) {
        productList = (response.data as List)
          .map((productJson) => Product.fromMap(productJson))
          .toList();
      }

      return productList;
    } on ApiException {
      rethrow;
    }on DioException catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }

  @override
  Future <List<Product>> sortByRatingdesc() async {
    try {
      final headers = _gen.getHeader();
      final response = await _dio.get(
        '$API_BASE_URL/users/sortbyratingdesc',
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }
      List<Product> productList = (response.data as List)
          .map((productJson) => Product.fromMap(productJson))
          .toList();
      return productList;
    } on ApiException {
      rethrow;
    }on DioException catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
  
  @override
  Future<void> addToCart({required String userId,required  String productId,required String token}) async{
    try {
      final headers = _gen.getHeaderWithToken(token);
      final response = await _dio.get(
        '$API_BASE_URL/addtocart?id=$productId&userID=$userId',
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    }on DioException catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
  
  @override
  Future<List<Product>> getCart({required String token,required String userId}) async{
    try {
      final headers = _gen.getHeaderWithToken(token);
      final response = await _dio.get(
        '$API_BASE_URL/listcart?id=$userId',
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }
      List<Product> productList = (response.data["cart"] as List)
          .map((productJson) => Product.fromMap(productJson))
          .toList();
      return productList;
    } on ApiException {
      rethrow;
    }on DioException catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }



}
