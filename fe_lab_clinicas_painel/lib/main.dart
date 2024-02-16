import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/bidings/lab_clinicas_application_binding.dart';
import 'package:fe_lab_clinicas_painel/pages/login/login_router.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/painel_router.dart';
import 'package:fe_lab_clinicas_painel/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const LabClinicasPainel());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasPainel extends StatelessWidget {
  const LabClinicasPainel({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinicas Painel',
      bindings: LabClinicasApplicationBinding(),
      pagesBuilder: [
        FlutterGetItPageBuilder(
          page: (_) => const SplashPage(),
          path: '/',
        ),
      ],
      pages: const [LoginRouter(), PainelRouter()],
    );
  }
}
