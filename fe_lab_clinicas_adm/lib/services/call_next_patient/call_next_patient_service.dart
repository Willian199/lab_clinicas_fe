import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class CallNextPatientService {
  Future<Either<RepositoryException, PatientInformationFormModel?>> execute();

  Future<Either<RepositoryException, PatientInformationFormModel?>> updatePanel(PatientInformationFormModel form);
}
