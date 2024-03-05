import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/painel_controller.dart';
import 'package:fe_lab_clinicas_painel/repository/painel_checkin/painel_checkin_repository.dart';
import 'package:fe_lab_clinicas_painel/repository/painel_checkin/painel_checkin_repository_impl.dart';

class PainelModule with DDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<PainelCheckinRepository>(() => PainelCheckinRepositoryImpl(restclient: inject()));
    registerApplication(() => PainelController(painelCheckinRepository: inject()));
  }
}
