import '../models/r/User.dart';
import '../../common/error/exceptions.dart';

import '../../utils/api_constants.dart';
import 'package:dio/dio.dart';

import 'header_gen.dart';

abstract class AuthRepo {
  Future<User> login(String email, String password);
  Future<bool> signUp(String email, String password, String firstName,
      String lastName, String phone);
}

class AuthRepoImpl implements AuthRepo {
  final Dio _dio;
  final HeaderGen _gen;
  AuthRepoImpl(this._dio, this._gen);

  @override
  Future<bool> signUp(String email, String password, String firstName,
      String lastName, String phone) async {
    try {
      final headers = _gen.getHeader();
      final response = await _dio.post(
        '$API_BASE_URL/users/signup',
        data: {
          'email': email,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
          'phone': phone
        },
        options: Options(headers: headers),
      );

      if (response.statusCode != 201) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }
      return true;
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
  Future<User> login(String email, String password) async {
    try {
      final headers = _gen.getHeader();
      final response = await _dio.post(
        '$API_BASE_URL/users/login',
        data: {'email': email, 'password': password},
        options: Options(headers: headers),
      );

      if (response.statusCode != 200) {
        throw ApiException(
          message: response.statusMessage.toString(),
          statusCode: response.statusCode,
        );
      }

      return User.fromMap(response.data);
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505,
      );
    }
  }
}
