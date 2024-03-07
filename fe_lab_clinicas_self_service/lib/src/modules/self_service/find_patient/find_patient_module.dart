import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:flutter/material.dart';

class FindPatientModule extends FlutterDDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication(() => FindPatientController(patientRepository: inject()));
  }

  @override
  String get path => '/find-patient';

  @override
  WidgetBuilder get page => (context) => const FindPatientPage();
}
