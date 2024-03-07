import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/home/home_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_module.dart';
import 'package:fe_lab_clinicas_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
/*


*/

class LabClinicasRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return FlutterDDIRouter.getRoutes(
      modules: [
        FlutterDDIPage.from(path: '/', page: (_) => const SplashPage()),
        LoginModule(),
        FlutterDDIPage.from(path: '/home', page: (_) => const HomePage()),
        SelfServiceModule(),
      ],
    );
  }
}
