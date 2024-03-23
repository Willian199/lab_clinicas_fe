import 'package:fe_lab_clinicas_adm/model/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/checkin_controller.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/widgets/checkin_image_link.dart';
import 'package:fe_lab_clinicas_adm/pages/checkin/widgets/checkin_title.dart';
import 'package:fe_lab_clinicas_adm/shared/data_item.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> with MessageViewMixin, DDIInject<CheckinController> {
  @override
  void initState() {
    messageListener(instance);

    effect(() {
      if (instance.endProcess()) {
        Navigator.of(context).pushReplacementNamed('/end-checkin');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    final PatientInformationFormModel(:password, :patient, :medicalOrders, :healthInsuranceCard) = instance.patientInformationForm.watch(context)!;

    return Scaffold(
      appBar: LabClinicasAppbar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(top: 56),
            width: sizeOf.width * .5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/patient_avatar.png'),
                const SizedBox(height: 16),
                const Text(
                  'A senha chamada foi',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: LabClinicasTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    password,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                const CheckInTitle(title: 'Cadastro'),
                const SizedBox(height: 24),
                DataItem(
                  label: 'Nome Paciente',
                  value: patient.name,
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                DataItem(
                  label: 'e-Mail',
                  value: patient.email,
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                DataItem(
                  label: 'Telefone de contato',
                  value: patient.phoneNumber,
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                DataItem(
                  label: 'CPF',
                  value: patient.document,
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                DataItem(
                  label: 'CEP',
                  value: patient.address.cep,
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                DataItem(
                  label: 'Endereço',
                  value: '${patient.address.streetAddress}, ${patient.address.number}, '
                      '${patient.address.addressComplement}, ${patient.address.district}, '
                      '${patient.address.city} - ${patient.address.state}',
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                DataItem(
                  label: 'Responsável',
                  value: patient.guardian,
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                DataItem(
                  label: 'Documento de Identificação',
                  value: patient.guardianIdentificationNumber,
                  padding: const EdgeInsets.only(bottom: 14),
                ),
                const SizedBox(height: 24),
                const CheckInTitle(title: 'Validar Imagens Exames'),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CheckinImageLink(
                      label: 'Carteirinha',
                      image: healthInsuranceCard,
                    ),
                    Column(
                      children: [
                        for (final (index, medicalOrder) in medicalOrders.indexed)
                          CheckinImageLink(
                            label: 'Pedido médico ${index + 1}',
                            image: medicalOrder,
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: instance.endCheckin,
                    child: const Text('FINALIZAR ATENDIMENTO'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
