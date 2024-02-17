import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/pages/login/login_controller.dart';
import 'package:fe_lab_clinicas_painel/pages/login/login_page.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/painel_module.dart';
import 'package:fe_lab_clinicas_painel/repository/user/user_repository.dart';
import 'package:fe_lab_clinicas_painel/repository/user/user_repository_impl.dart';
import 'package:fe_lab_clinicas_painel/service/user/user_login_service.dart';
import 'package:fe_lab_clinicas_painel/service/user/user_login_service_impl.dart';
import 'package:flutter/material.dart';

class LoginModule extends FlutterModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<UserRepository>(() => UserRepositoryImpl(restClient: inject()));
    registerApplication<UserLoginService>(() => UserLoginServiceImpl(userRepository: inject()));
    registerApplication(() => LoginController(loginService: inject()));

    registerPage(PainelModule.new);
  }

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
