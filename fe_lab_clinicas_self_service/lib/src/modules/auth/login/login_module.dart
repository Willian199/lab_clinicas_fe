import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user/user_login_service.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user/user_login_service_impl.dart';

class LoginModule with DDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<UserRepository>(() => UserRepositoryImpl(restClient: inject()));
    registerApplication<UserLoginService>(() => UserLoginServiceImpl(userRepository: inject()));
    registerApplication(() => LoginController(userLoginService: inject<UserLoginService>()));
  }
}