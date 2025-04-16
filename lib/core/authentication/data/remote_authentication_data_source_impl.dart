import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:phongngo.pokedex/core/authentication/data/i_remote_authentication_data_source.dart';
import 'package:phongngo.pokedex/core/authentication/data/user_model.dart';
import 'package:phongngo.pokedex/core/authentication/domain/entities/login_entity.dart';

class RemoteAuthenticationDataSourceImpl
    implements IRemoteAuthenticationDataSource {
  final Dio _dio;

  RemoteAuthenticationDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<String, UserModel>> login(LoginEntity loginEntity) async {
    try {
      // Fake API call for demonstration purposes
      await Future.delayed(const Duration(seconds: 2));
      final response = Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: <String, dynamic>{
            'id': 1,
            'name': loginEntity.userName,
            'email': 'joindoe@gmail.com',
            'phone': '1234567890',
            'address': '123 Main St',
            'avatarUrl': 'https://example.com/avatar.jpg',
          });
      final responseData = response.data;
      if (response.statusCode == 200 && responseData != null) {
        final userModel = UserModel.fromJson(responseData);
        return Right(userModel);
      } else {
        return Left('Login failed. Please try again.');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      final response = await _dio.post('https://example.com/api/logout');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
