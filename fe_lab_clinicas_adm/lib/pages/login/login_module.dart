import 'dart:async';

import 'package:fe_lab_clinicas_adm/pages/login/login_controller.dart';
import 'package:fe_lab_clinicas_adm/repository/user/user_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/user/user_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/services/user/user_login_service.dart';
import 'package:fe_lab_clinicas_adm/services/user/user_login_service_impl.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class LoginModule with DDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<UserRepository>(UserRepositoryImpl.new);
    registerApplication<UserLoginService>(UserLoginServiceImpl.new);
    registerApplication(
      () => LoginController(loginService: inject()),
    );
  }
}
