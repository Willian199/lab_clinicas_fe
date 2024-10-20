import 'dart:async';

import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/pre_checkin/pre_checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/pre_checkin/pre_checkin_page.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PreCheckinModule extends FlutterDDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication(PreCheckinController.new);
    registerApplication(CheckinController.new);
  }

  @override
  String get path => '/pre-checkin';

  @override
  WidgetBuilder get page => (context) {
        final form = context.arguments<PatientInformationFormModel>();
        context.get<PreCheckinController>().patientInformationForm.value = form;

        return const PreCheckinPage();
      };
}
