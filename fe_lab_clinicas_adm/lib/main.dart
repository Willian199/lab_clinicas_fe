import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_adm/bidings/lab_clinicas_application_binding.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/checkin_router.dart';
import 'package:fe_lab_clinicas_adm/pages/end_checkin/end_checkin_router.dart';
import 'package:fe_lab_clinicas_adm/pages/home/home_route.dart';
import 'package:fe_lab_clinicas_adm/pages/login/login_router.dart';
import 'package:fe_lab_clinicas_adm/pages/pre_checkin/pre_checkin_router.dart';
import 'package:fe_lab_clinicas_adm/pages/splash/splash_page.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const LabClinicasAdm());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasAdm extends StatelessWidget {
  const LabClinicasAdm({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinicas ADM',
      bindings: LabClinicasApplicationBinding(),
      pagesBuilder: [
        FlutterGetItPageBuilder(
          page: (_) => const SplashPage(),
          path: '/',
        ),
      ],
      pages: const [
        LoginRouter(),
        HomeRouter(),
        PreCheckinRouter(),
        CheckinRouter(),
        EndCheckinRouter(),
      ],
    );
  }
}
