import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/documents_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/information_form/information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patient/patient_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patient/patient_repository_impl.dart';
import 'package:flutter/material.dart';

class SelfServiceModule extends FlutterDDIModuleRouter with DDIModule {
  @override
  List<FlutterDDIModuleDefine> get modules => [
        FlutterDDIPage.from(path: '/whoIAm', page: (_) => const WhoIAmPage()),
        FlutterDDIPage.from(path: '/done', page: (_) => DonePage()),
        FindPatientModule(),
        PatientModule(),
        DocumentsModule(),
      ];

  @override
  WidgetBuilder get page => (_) => const SelfServicePage();

  @override
  String get path => '/self-service';

  @override
  FutureOr<void> onPostConstruct() {
    register<InformationFormRepository>(factory: ScopeFactory.application(builder: InformationFormRepositoryImpl.new.builder));
    register(factory: ScopeFactory.application(builder: SelfServiceController.new.builder));
    register<PatientRepository>(factory: ScopeFactory.application(builder: PatientRepositoryImpl.new.builder));
  }
}
