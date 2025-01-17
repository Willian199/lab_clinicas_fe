import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import './user_repository.dart';

class UserRepositoryImpl with DDIInject<RestClient> implements UserRepository {
  UserRepositoryImpl();

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try {
      final Response(data: {'access_token': accessToken}) = await instance.unAuth.post('/auth', data: {
        'email': email,
        'password': password,
        'admin': true,
      });

      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);

      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) => Left(AuthUnauthorizedException()),
        _ => Left(AuthErrorException(message: 'Erro ao realizar Login'))
      };
    }
  }
}
