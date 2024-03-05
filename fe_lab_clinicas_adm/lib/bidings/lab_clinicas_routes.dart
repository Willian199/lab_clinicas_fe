import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/ckeckin_page.dart';
import 'package:fe_lab_clinicas_adm/pages/end_checkin/end_checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/end_checkin/end_checkin_page.dart';
import 'package:fe_lab_clinicas_adm/pages/home/home_module.dart';
import 'package:fe_lab_clinicas_adm/pages/home/home_page.dart';
import 'package:fe_lab_clinicas_adm/pages/login/login_module.dart';
import 'package:fe_lab_clinicas_adm/pages/login/login_page.dart';
import 'package:fe_lab_clinicas_adm/pages/pre_checkin/pre_checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/pre_checkin/pre_checkin_page.dart';
import 'package:fe_lab_clinicas_adm/pages/splash/splash_page.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class LabClinicasRoute {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (_) => const SplashPage(),
      '/login': (_) => const FlutterDDIWidget(
            module: LoginModule.new,
            child: LoginPage(),
          ),
      '/home': (_) {
        DDI.instance.registerSingleton(HomeModule.new);
        DDI.instance.registerApplication(() => PreCheckinController(callNextPatientService: DDI.instance.get()));
        DDI.instance.registerApplication(() => CheckinController(patientInformationFormRepository: DDI.instance.get()));
        return const HomePage();
      },
      '/pre-checkin': (context) {
        final form = ModalRoute.of(context)!.settings.arguments as PatientInformationFormModel;
        context.get<PreCheckinController>().patientInformationForm.value = form;

        return const PreCheckinPage();
      },
      '/checkin': (context) {
        final form = ModalRoute.of(context)!.settings.arguments as PatientInformationFormModel;
        context.get<CheckinController>().patientInformationForm.value = form;

        return const CheckinPage();
      },
      '/end-checkin': (_) => FlutterDDIWidget(
            module: () => EndCheckinController(callNextPatientService: DDI.instance.get()),
            child: const EndCheckinPage(),
          )
    };
  }
}
