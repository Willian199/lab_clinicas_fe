import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/home/home_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan/documents_scan_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/done/done_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:fe_lab_clinicas_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

class LabClinicasRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (_) => const SplashPage(),
      '/auth/login': (_) => const FlutterDDIWidget(
            module: LoginModule.new,
            child: LoginPage(),
          ),
      '/home': (_) => const HomePage(),
      '/self-service': (_) => const FlutterDDIWidget(
            module: SelfServiceModule.new,
            child: SelfServicePage(),
          ),
      '/self-service/whoIAm': (_) => const WhoIAmPage(),
      '/self-service/find-patient': (_) => const FlutterDDIWidget(
            module: FindPatientModule.new,
            child: FindPatientPage(),
          ),
      '/self-service/patient': (_) => const FlutterDDIWidget(
            module: PatientModule.new,
            child: PatientPage(),
          ),
      '/self-service/documents': (_) => const DocumentsPage(),
      '/self-service/documents/scan': (_) => const DocumentsScanPage(),
      '/self-service/documents/scan/confirm': (_) => FlutterDDIWidget(
            module: DocumentsScanConfirmModule.new,
            child: DocumentsScanConfirmPage(),
          ),
      '/self-service/done': (_) => DonePage(),
    };
  }
}
