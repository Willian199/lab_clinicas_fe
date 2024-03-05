import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patient/patient_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patient/patient_repository_impl.dart';

class SelfServiceModule with DDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<InformationFormRepository>(() => InformationFormRepositoryImpl(restClient: inject()));
    registerApplication(() => SelfServiceController(informationRepository: inject()));
    registerApplication<PatientRepository>(() => PatientRepositoryImpl(restClient: inject()));
  }
}
