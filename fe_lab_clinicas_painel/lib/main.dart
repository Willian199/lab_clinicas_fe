import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/bidings/lab_clinicas_application_binding.dart';
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
    return const FlutterDDIModule(
      module: LabClinicasApplicationBinding.new,
      moduleName: '/',
      child: LabClinicasCoreConfig(
        title: 'Lab Clinicas Painel',
      ),
    );
  }
}
