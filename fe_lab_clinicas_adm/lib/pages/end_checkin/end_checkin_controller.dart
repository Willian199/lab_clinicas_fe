import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/services/call_next_patient/call_next_patient_service.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckinController with MessageStateMixin, DDIInject<CallNextPatientService> {
  EndCheckinController();

  final patientInformationForm = signal<PatientInformationFormModel?>(null);

  Future<void> callNextPatient() async {
    final response = await instance.execute();

    switch (response) {
      case Left(value: RepositoryException(:final message)):
        showError(message);
      case Right(value: final form?):
        patientInformationForm.value = form;
      case _:
        showInfo('Nenhum paciente aguardando, pode ir tomar um café.');
    }
  }
}
