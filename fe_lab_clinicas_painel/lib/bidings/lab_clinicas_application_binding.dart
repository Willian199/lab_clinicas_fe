import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/core/env.dart';
import 'package:fe_lab_clinicas_painel/pages/login/login_module.dart';
import 'package:fe_lab_clinicas_painel/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class LabClinicasApplicationBinding extends FlutterModule {
  @override
  Object get moduleQualifier => '/';

  @override
  FutureOr<void> onPostConstruct() {
    registerSingleton(
      () => RestClient(Env.backendBaseUrl),
      destroyable: false,
    );

    registerPage(LoginModule.new);
  }

  @override
  WidgetBuilder get view => (_) => const SplashPage();
}
