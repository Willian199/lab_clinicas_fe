import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/bidings/lab_clinicas_routes.dart';
import 'package:fe_lab_clinicas_painel/core/env.dart';
import 'package:flutter/material.dart';

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
    return FlutterDDIWidget(
      module: () => RestClient(Env.backendBaseUrl),
      child: LabClinicasCoreConfig(
        title: 'Lab Clinicas Painel',
        routes: LabClinicasRoute.getRoutes(),
      ),
    );
  }
}
