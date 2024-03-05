import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/binding/lab_clinicas_router.dart';
import 'package:fe_lab_clinicas_self_service/src/core/env.dart';
import 'package:flutter/material.dart';

// ignore: unused_element
late List<CameraDescription> _cameras;
void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();

    runApp(const LabClinicasSelfServiceApp());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicasSelfServiceApp extends StatelessWidget {
  const LabClinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDDIWidget(
      module: () => RestClient(Env.backendBaseUrl),
      child: LabClinicasCoreConfig(
        title: 'Lab Clinicas Auto Atendimento',
        routes: LabClinicasRoutes.getRoutes(),
        didStart: () {
          DDI.instance.registerSingleton<List<CameraDescription>>(() => _cameras);
        },
      ),
    );
  }
}
