import 'package:fe_lab_clinicas_self_service/src/model/patient_model.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/patient/patient_repository.dart';
import 'package:flutter/material.dart';

mixin PatientFormController on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final streetEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianIdentificationNumberEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    documentEC.dispose();
    cepEC.dispose();
    streetEC.dispose();
    numberEC.dispose();
    complementEC.dispose();
    stateEC.dispose();
    cityEC.dispose();
    districtEC.dispose();
    guardianEC.dispose();
    guardianIdentificationNumberEC.dispose();
  }

  void initializeForm(final PatientModel? patientModel) {
    if (patientModel != null) {
      nameEC.text = patientModel.name;
      emailEC.text = patientModel.email;
      phoneEC.text = patientModel.phoneNumber;
      documentEC.text = patientModel.document;
      cepEC.text = patientModel.address.cep;
      streetEC.text = patientModel.address.streetAddress;
      numberEC.text = patientModel.address.number;
      complementEC.text = patientModel.address.addressComplement;
      stateEC.text = patientModel.address.state;
      cityEC.text = patientModel.address.city;
      districtEC.text = patientModel.address.district;
      guardianEC.text = patientModel.guardian;
      guardianIdentificationNumberEC.text = patientModel.guardianIdentificationNumber;
    }
  }

  PatientModel updatePatient(PatientModel patient) {
    return patient.copyWith(
      document: documentEC.text,
      email: emailEC.text,
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
      name: nameEC.text,
      phoneNumber: phoneEC.text,
      address: patient.address.copyWith(
        addressComplement: complementEC.text,
        cep: cepEC.text,
        city: cityEC.text,
        district: districtEC.text,
        number: numberEC.text,
        state: stateEC.text,
        streetAddress: streetEC.text,
      ),
    );
  }

  RegisterPatientModel createPatientRegister() {
    return (
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneEC.text,
      document: documentEC.text,
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianIdentificationNumberEC.text,
      address: (
        cep: cepEC.text,
        streetAddress: streetEC.text,
        addressComplement: complementEC.text,
        state: stateEC.text,
        city: cityEC.text,
        district: districtEC.text,
        number: numberEC.text,
      )
    );
  }
}
