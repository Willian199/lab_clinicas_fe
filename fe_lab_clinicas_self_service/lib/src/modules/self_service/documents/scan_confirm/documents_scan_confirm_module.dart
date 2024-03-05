import 'dart:async';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/documents/documents_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/documents/documents_repository_impl.dart';

class DocumentsScanConfirmModule with DDIModule {
  @override
  FutureOr<void> onPostConstruct() {
    registerApplication<DocumentsRepository>(() => DocumentsRepositoryImpl(restClient: inject()));
    registerApplication(() => DocumentsScanConfirmController(documentsRepository: inject()));
  }
}
