import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_controller.dart';

class FindPatientModule with DDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication(() => FindPatientController(patientRepository: inject()));
  }
}
