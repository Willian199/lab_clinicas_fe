import 'dart:async';

import 'package:fe_lab_clinicas_adm/pages/end_checkin/end_checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/end_checkin/end_checkin_page.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class EndCheckinModule extends FlutterDDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication(() => EndCheckinController(callNextPatientService: DDI.instance.get()));
  }

  @override
  String get path => '/end-checkin';

  @override
  WidgetBuilder get page => (_) => const EndCheckinPage();
}
