import 'dart:developer';

import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:flutter/material.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    required this.title,
    super.key,
    this.didStart,
  });

  final String title;
  final VoidCallback? didStart;

  @override
  Widget build(BuildContext context) {
    final ddiNavigatorObserver = DDINavigatorObserver();

    return AsyncStateBuilder(
      loader: LabClinicasLoader(),
      builder: (navigatorObserver) {
        didStart?.call();

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: LabClinicasTheme.lightTheme,
          darkTheme: LabClinicasTheme.darkTheme,
          navigatorObservers: [
            navigatorObserver,
            ddiNavigatorObserver,
          ],
          title: title,
          onGenerateRoute: (RouteSettings settings) {
            final FlutterModule instance = DDI.instance.get(qualifier: settings.name);
            log('Navigating to /${instance.runtimeType}');

            return MaterialPageRoute(
              settings: settings,
              builder: instance.view,
            );
          },
        );
      },
    );
  }
}
