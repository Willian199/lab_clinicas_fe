import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_page.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user/user_login_service.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user/user_login_service_impl.dart';
import 'package:flutter/material.dart';

class LoginModule extends FlutterDDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    register<UserRepository>(factory: ScopeFactory.application(builder: UserRepositoryImpl.new.builder));
    register<UserLoginService>(factory: ScopeFactory.application(builder: UserLoginServiceImpl.new.builder));
    register(factory: ScopeFactory.application(builder: LoginController.new.builder));
  }

  @override
  WidgetBuilder get page => (_) => const LoginPage();

  @override
  String get path => '/auth/login';
}
