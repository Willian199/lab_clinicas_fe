import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/pages/login/login_module.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/painel_module.dart';
import 'package:fe_lab_clinicas_painel/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class LabClinicasRoute {
  static Map<String, WidgetBuilder> getRoutes() {
    return FlutterDDIRouter.getRoutes(
      modules: [
        FlutterDDIPage.from(path: '/', page: (_) => const SplashPage()),
        LoginModule(),
        PainelModule(),
      ],
    );
  }
}
