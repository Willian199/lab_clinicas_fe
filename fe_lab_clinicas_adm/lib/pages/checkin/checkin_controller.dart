import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/repository/patient_information_form/patient_information_form_repository.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinController with MessageStateMixin, DDIInject<PatientInformationFormRepository> {
  CheckinController();

  final patientInformationForm = signal<PatientInformationFormModel?>(null);
  final endProcess = signal(false);

  Future<void> endCheckin() async {
    if (patientInformationForm.value != null) {
      final response = await instance.updateStatus(
        patientInformationForm.value!.id,
        PatientInformationFormStatus.beingAttended,
      );

      switch (response) {
        case Left(value: RepositoryException(:final message)):
          showError(message);
        case Right():
          endProcess.value = true;
      }
    } else {
      showError('Formulário não pode ser nulo.');
    }
  }
}
