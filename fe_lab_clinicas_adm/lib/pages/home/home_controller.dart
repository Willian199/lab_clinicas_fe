import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/repository/attendent_desk_assignment/attendent_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:asyncstate/asyncstate.dart' as asyncstate;

class HomeController with MessageStateMixin {
  HomeController({
    required AttendantDeskAssignmentRepository attendantDeskAssignmentRepository,
    required CallNextPatientService callNextPatientService,
  })  : _attendantDeskAssignmentRepository = attendantDeskAssignmentRepository,
        _callNextPatientService = callNextPatientService;

  final AttendantDeskAssignmentRepository _attendantDeskAssignmentRepository;
  final CallNextPatientService _callNextPatientService;

  final _informationForm = signal<PatientInformationFormModel?>(null);

  PatientInformationFormModel? get informationForm => _informationForm();

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();

    final response = await _attendantDeskAssignmentRepository.startService(deskNumber);

    switch (response) {
      case Left(value: RepositoryException(:final message)):
        asyncstate.AsyncState.hide();
        showError(message);
      case Right():
        final nextPatientResponse = await _callNextPatientService.execute();

        switch (nextPatientResponse) {
          case Left(value: RepositoryException(:final message)):
            asyncstate.AsyncState.hide();
            showError(message);
          case Right(value: final form?):
            asyncstate.AsyncState.hide();
            _informationForm.value = form;
          case Right(value: _):
            asyncstate.AsyncState.hide();
            showInfo('Nenhum paciente aguardando, pode ir tomar um cafezinho.');
        }
    }
  }
}
