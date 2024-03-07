import 'package:fe_lab_clinicas_adm/pages/checkin/checkin_module.dart';
import 'package:fe_lab_clinicas_adm/pages/end_checkin/end_checkin_module.dart';
import 'package:fe_lab_clinicas_adm/pages/home/home_module.dart';
import 'package:fe_lab_clinicas_adm/pages/login/login_module.dart';
import 'package:fe_lab_clinicas_adm/pages/pre_checkin/pre_checkin_module.dart';
import 'package:fe_lab_clinicas_adm/pages/splash/splash_page.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class LabClinicasRoute {
  static Map<String, WidgetBuilder> getRoutes() {
    return FlutterDDIRouter.getRoutes(
      modules: [
        FlutterDDIPage.from(path: '/', page: (_) => const SplashPage()),
        LoginModule(),
        HomeModule(),
        PreCheckinModule(),
        CheckinModule(),
        EndCheckinModule()
      ],
    );
  }
}
