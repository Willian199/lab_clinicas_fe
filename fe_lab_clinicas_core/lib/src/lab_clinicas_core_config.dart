import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:flutter/material.dart';

class LabClinicasCoreConfig<BeanT extends Object> extends StatelessWidget {
  const LabClinicasCoreConfig({
    required this.title,
    super.key,
    this.didStart,
    this.routes = const <String, WidgetBuilder>{},
  });

  final String title;
  final VoidCallback? didStart;
  final Map<String, WidgetBuilder> routes;

  @override
  Widget build(BuildContext context) {
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
          ],
          title: title,
          routes: routes,
        );
      },
    );
  }
}
