import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_login_service.dart';

class UserLoginServiceImpl with DDIInject<UserRepository> implements UserLoginService {
  UserLoginServiceImpl();
  @override
  Future<Either<ServiceException, Unit>> execute(String email, String password) async {
    final loginResult = await instance.login(email, password);

    switch (loginResult) {
      case Left(value: AuthErrorException()):
        return Left(ServiceException(message: 'Erro ao realizar Login'));
      case Left(value: AuthUnauthorizedException()):
        return Left(ServiceException(message: 'Login ou senha inválido'));
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalStorageConstantes.accessToken, accessToken);
        return Right(unit);
    }
  }
}
