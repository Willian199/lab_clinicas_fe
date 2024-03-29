import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SelfServicePage extends StatefulWidget {
  const SelfServicePage({super.key});

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage> with MessageViewMixin, DDIInject<SelfServiceController> {
  @override
  void initState() {
    messageListener(instance);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      instance.startProcess();
      effect(() {
        var baseRoute = '/self-service/';
        final step = instance.step;

        switch (step) {
          case FormSteps.restart:
            Navigator.of(context).popUntil(
              ModalRoute.withName('/self-service'),
            );
            instance.startProcess();
            return;
          case FormSteps.none:
            return;
          case FormSteps.whoIAm:
            baseRoute += 'whoIAm';
          case FormSteps.findPatient:
            baseRoute += 'find-patient';
          case FormSteps.patient:
            baseRoute += 'patient';
          case FormSteps.documents:
            baseRoute += 'documents';
          case FormSteps.done:
            baseRoute += 'done';
        }

        Navigator.of(context).pushNamed(baseRoute);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
