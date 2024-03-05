import 'package:fe_lab_clinicas_adm/pages/end_checkin/end_checkin_controller.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckinPage extends StatefulWidget {
  const EndCheckinPage({super.key});

  @override
  State<EndCheckinPage> createState() => _EndCheckinPageState();
}

class _EndCheckinPageState extends State<EndCheckinPage> with MessageViewMixin, FlutterController<EndCheckinController> {
  @override
  void initState() {
    messageListener(controller);

    effect(() {
      if (controller.patientInformationForm() != null) {
        Navigator.of(context).pushReplacementNamed(
          '/pre-checkin',
          arguments: controller.patientInformationForm.value,
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicasAppbar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: sizeOf.width * .4,
          padding: const EdgeInsets.all(32),
          margin: const EdgeInsets.only(top: 56),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/check_icon.png'),
              const SizedBox(height: 40),
              const Text(
                'Atendimento finalizado com sucesso',
                style: LabClinicasTheme.titleSmallStyle,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.callNextPatient,
                  child: const Text('CHAMAR OUTRA SENHA'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
