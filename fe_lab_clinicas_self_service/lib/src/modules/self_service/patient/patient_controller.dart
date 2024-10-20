import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patient/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  PatientController(this._patientRepository);

  final PatientRepository _patientRepository;

  PatientModel? patient;
  final _nextStep = signal<bool>(false);
  bool get nextStep => _nextStep.value;

  void goNextStep() {
    _nextStep.value = true;
  }

  void updateAndNext(PatientModel patientModel) async {
    final result = await _patientRepository.update(patientModel);

    switch (result) {
      case Left():
        showError('Erro ao atualizar dados do paciente, chame o atendente');
      case Right():
        patient = patientModel;
        showInfo('Paciente atualizado com sucesso');
        goNextStep();
    }
  }

  Future<void> saveAndNext(RegisterPatientModel registerPatientModel) async {
    final result = await _patientRepository.register(registerPatientModel);

    switch (result) {
      case Left():
        showError('Erro ao cadastrar o paciente, chame o atendente');
      case Right(value: final patientModel):
        patient = patientModel;
        showInfo('Paciente cadastrado com sucesso');
        goNextStep();
    }
  }
}
