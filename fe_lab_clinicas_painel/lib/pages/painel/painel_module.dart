import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/painel_controller.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/painel_page.dart';
import 'package:fe_lab_clinicas_painel/repository/painel_checkin/painel_checkin_repository.dart';
import 'package:fe_lab_clinicas_painel/repository/painel_checkin/painel_checkin_repository_impl.dart';
import 'package:flutter/material.dart';

class PainelModule extends FlutterDDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<PainelCheckinRepository>(() => PainelCheckinRepositoryImpl(restclient: inject()));
    registerApplication(() => PainelController(painelCheckinRepository: inject()));
  }

  @override
  WidgetBuilder get page => (_) => const PainelPage();

  @override
  String get path => '/painel';
}
