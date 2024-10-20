import 'dart:developer';

import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/repository/attendent_desk_assignment/attendent_desk_assignment_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/panel/panel_repository.dart';
import 'package:fe_lab_clinicas_adm/repository/patient_information_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import 'call_next_patient_service.dart';

class CallNextPatientServiceImpl implements CallNextPatientService {
  CallNextPatientServiceImpl(
    this._patientInformationFormRepository,
    this._attendantDeskAssignmentRepository,
    this._panelRepository,
  );

  final PatientInformationFormRepository _patientInformationFormRepository;
  final AttendantDeskAssignmentRepository _attendantDeskAssignmentRepository;
  final PanelRepository _panelRepository;

  @override
  Future<Either<RepositoryException, PatientInformationFormModel?>> execute() async {
    final result = await _patientInformationFormRepository.callNextToCheckin();

    switch (result) {
      case Left(value: final exception):
        return Left(exception);

      case Right(value: final form?):
        return updatePanel(form);
      case Right():
        return Right(null);
    }
  }

  @override
  Future<Either<RepositoryException, PatientInformationFormModel?>> updatePanel(
    PatientInformationFormModel form,
  ) async {
    final response = await _attendantDeskAssignmentRepository.getDeskAssignment();

    switch (response) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final deskNumber):
        final panelResponse = await _panelRepository.callOnPanel(form.password, deskNumber);

        switch (panelResponse) {
          case Left(value: final exception):
            log(
              'ATENÇÃO: Não foi possível chamar o paciente.',
              error: exception,
              stackTrace: StackTrace.fromString('ATENÇÃO: Não foi possível chamar o paciente.'),
            );

            return Right(form);

          case Right():
            return Right(form);
        }
    }
  }
}
