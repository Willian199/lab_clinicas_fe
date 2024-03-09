import 'dart:async';

import 'package:fe_lab_clinicas_adm/pages/home/home_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/home/home_page.dart';
import 'package:fe_lab_clinicas_adm/repository/attendent_desk_assignment/attendent_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/attendent_desk_assignment/attendent_desk_assignment_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/repository/panel/panel_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/panel/panel_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/repository/patient_information_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/patient_information_form/patient_information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_adm/services/call_next_patient/call_next_patient_service_impl.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class HomeModule extends FlutterDDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<PatientInformationFormRepository>(() => PatientInformationFormRepositoryImpl(restClient: ddi()));
    registerApplication<PanelRepository>(() => PanelRepositoryImpl(restClient: ddi()));
    registerApplication<AttendantDeskAssignmentRepository>(() => AttendantDeskAssignmentRepositoryImpl(restClient: ddi()));

    registerApplication<CallNextPatientService>(() => CallNextPatientServiceImpl(
          patientInformationFormRepository: ddi(),
          attendantDeskAssignmentRepository: ddi(),
          panelRepository: ddi(),
        ));

    registerApplication(() => HomeController(attendantDeskAssignmentRepository: ddi(), callNextPatientService: ddi()));
  }

  @override
  String get path => '/home';

  @override
  WidgetBuilder get page => (_) => const HomePage();
}
