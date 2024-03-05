import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_controller.dart';

class PatientModule with DDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication(() => PatientController(patientRepository: inject()));
  }
}
