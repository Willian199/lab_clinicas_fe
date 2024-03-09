import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:flutter/material.dart';

class PatientModule extends FlutterDDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication(() => PatientController(patientRepository: ddi()));
  }

  @override
  String get path => '/patient';

  @override
  WidgetBuilder get page => (context) => const PatientPage();
}
