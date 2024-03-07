import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/ckeckin_page.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class CheckinModule extends FlutterDDIPage {
  @override
  String get path => '/checkin';

  @override
  WidgetBuilder get page => (context) {
        final form = ModalRoute.of(context)!.settings.arguments as PatientInformationFormModel;
        context.get<CheckinController>().patientInformationForm.value = form;

        return const CheckinPage();
      };
}
