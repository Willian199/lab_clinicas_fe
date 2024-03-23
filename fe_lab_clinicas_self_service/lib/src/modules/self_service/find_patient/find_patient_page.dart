import 'package:brasil_fields/brasil_fields.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widget/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class FindPatientPage extends StatefulWidget {
  const FindPatientPage({super.key});

  @override
  State<FindPatientPage> createState() => _FindPatientPageState();
}

class _FindPatientPageState extends State<FindPatientPage> with MessageViewMixin, DDIInject<FindPatientController> {
  final formKey = GlobalKey<FormState>();

  final documentEC = TextEditingController();

  @override
  void initState() {
    messageListener(instance);
    effect(() {
      final FindPatientController(:patient, :patientNotFound) = instance;

      if (patient != null || patientNotFound != null) {
        ddi.get<SelfServiceController>().goToFormPatient(patient);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    documentEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          var width = MediaQuery.sizeOf(context).width;
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  width: width * .8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_vertical.png'),
                        const SizedBox(
                          height: 48,
                        ),
                        TextFormField(
                          controller: documentEC,
                          onEditingComplete: () {
                            final valid = formKey.currentState?.validate() ?? false;
                            if (valid) {
                              instance.findPatientByDocument(documentEC.text);
                            }
                          },
                          validator: Validatorless.required('CPF obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Digite o CPF do paciente'),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Não sabe o CPF do paciente',
                              style: TextStyle(
                                fontSize: 10,
                                color: LabClinicasTheme.blueColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                instance.continueWithoutDocument();
                              },
                              child: const Text(
                                'Clique aqui',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: LabClinicasTheme.orangeColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          width: width * .8,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              final valid = formKey.currentState?.validate() ?? false;
                              if (valid) {
                                instance.findPatientByDocument(documentEC.text);
                              }
                            },
                            child: const Text('Continuar'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
