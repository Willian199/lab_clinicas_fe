import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/model/self_service_model.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/documents/widgets/documents_box_widget.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/widget/lab_clinicas_self_service_app_bar.dart';
import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> with MessageViewMixin, DDIInject<SelfServiceController> {
  @override
  void initState() {
    messageListener(instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final documents = instance.model.documents;
    final totalHealthInsureceCard = documents?[DocumentType.healthInsureceCard]?.length ?? 0;
    final totalMedicalOrder = documents?[DocumentType.medicalOrder]?.length ?? 0;

    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: LabClinicasTheme.orangeColor)),
            child: Column(
              children: [
                Image.asset('assets/images/folder.png'),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Adicionar Documentos',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  'Selecionar o documento que deseja fotografar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: LabClinicasTheme.blueColor),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: sizeOf.width * .8,
                  height: 300,
                  child: Row(
                    children: [
                      DocumentsBoxWidget(
                        upload: totalHealthInsureceCard > 0,
                        icon: Image.asset('assets/images/id_card.png'),
                        label: 'CARTEIRINHA',
                        totalFiles: totalHealthInsureceCard,
                        onTap: () async {
                          final filePath = await Navigator.of(context).pushNamed('/self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            instance.registerDocument(
                              DocumentType.healthInsureceCard,
                              filePath.toString(),
                            );
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      DocumentsBoxWidget(
                        upload: totalMedicalOrder > 0,
                        icon: Image.asset('assets/images/document.png'),
                        label: 'PEDIDO MÉDICO',
                        totalFiles: totalMedicalOrder,
                        onTap: () async {
                          final filePath = await Navigator.of(context).pushNamed('/self-service/documents/scan');
                          if (filePath != null && filePath != '') {
                            instance.registerDocument(
                              DocumentType.medicalOrder,
                              filePath.toString(),
                            );
                            setState(() {});
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Visibility(
                  visible: totalMedicalOrder > 0 && totalHealthInsureceCard > 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            fixedSize: const Size.fromHeight(48),
                          ),
                          onPressed: () {
                            instance.clearDocuments();
                            setState(() {});
                          },
                          child: const Text('REMOVER TODAS'),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: LabClinicasTheme.orangeColor,
                            fixedSize: const Size.fromHeight(48),
                          ),
                          onPressed: () async {
                            await instance.finalize();
                          },
                          child: const Text('FINALIZAR'),
                        ),
                      ),
                    ],
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
