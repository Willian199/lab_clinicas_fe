import 'package:fe_lab_clinicas_adm/core/env.dart';
import 'package:fe_lab_clinicas_adm/repository/attendent_desk_assignment/attendent_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/attendent_desk_assignment/attendent_desk_assignment_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/repository/panel/panel_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/panel/panel_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/repository/patient_information_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/patient_information_form/patient_information_form_repository_impl.dart';
import 'package:fe_lab_clinicas_adm/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_adm/services/call_next_patient/call_next_patient_service_impl.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton(
          (i) => RestClient(Env.backendBaseUrl),
        ),
        Bind.lazySingleton<PatientInformationFormRepository>(
          (i) => PatientInformationFormRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton<AttendantDeskAssignmentRepository>(
          (i) => AttendantDeskAssignmentRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton<PanelRepository>(
          (i) => PanelRepositoryImpl(restClient: i()),
        ),
        Bind.lazySingleton<CallNextPatientService>(
          (i) => CallNextPatientServiceImpl(
            patientInformationFormRepository: i(),
            attendantDeskAssignmentRepository: i(),
            panelRepository: i(),
          ),
        ),
      ];
}
