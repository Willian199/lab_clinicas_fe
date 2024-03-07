import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/documents_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan/documents_scan_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_module.dart';
import 'package:flutter/material.dart';

class DocumentsModule extends FlutterDDIModuleRouter {
  @override
  String get path => '/documents';

  @override
  WidgetBuilder get page => (_) => const DocumentsPage();

  @override
  List<FlutterDDIModuleDefine> get modules => [
        _ScanModule(),
      ];
}

class _ScanModule extends FlutterDDIModuleRouter {
  @override
  List<FlutterDDIModuleDefine> get modules => [
        DocumentsScanConfirmModule(),
      ];

  @override
  String get path => '/scan';

  @override
  WidgetBuilder get page => (_) => const DocumentsScanPage();
}
