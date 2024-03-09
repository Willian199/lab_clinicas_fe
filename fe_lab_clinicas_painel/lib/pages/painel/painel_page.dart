import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_painel/model/painel_checkin_model.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/painel_controller.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/widget/painel_principal_widget.dart';
import 'package:fe_lab_clinicas_painel/pages/painel/widget/password_tile.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PainelPage extends StatefulWidget {
  const PainelPage({super.key});

  @override
  State<PainelPage> createState() => _PainelPageState();
}

class _PainelPageState extends State<PainelPage> with DDIController<PainelController> {
  @override
  void initState() {
    controller.listenerPainel();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    final listPanel = controller.painelData.watch(context);

    final PainelCheckinModel? current = listPanel.firstOrNull;

    if (listPanel.isNotEmpty) {
      listPanel.removeAt(0);
    }

    final PainelCheckinModel? lastCall = listPanel.firstOrNull;

    if (listPanel.isNotEmpty) {
      listPanel.removeAt(0);
    }

    final List<PainelCheckinModel> others = listPanel;

    return Scaffold(
      appBar: LabClinicasAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                lastCall != null
                    ? SizedBox(
                        width: sizeOf.width * .4,
                        child: PainelPrincipalWidget(
                          password: lastCall.password,
                          passwordLabel: 'Senha anterior',
                          deskNumber: lastCall.attendantDesk.toString(),
                          buttonColor: LabClinicasTheme.blueColor,
                          labelColor: LabClinicasTheme.orangeColor,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  width: 20,
                ),
                current != null
                    ? SizedBox(
                        width: sizeOf.width * .4,
                        child: PainelPrincipalWidget(
                          password: current.password,
                          passwordLabel: 'Chamando senha',
                          deskNumber: current.attendantDesk.toString(),
                          buttonColor: LabClinicasTheme.orangeColor,
                          labelColor: LabClinicasTheme.blueColor,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              color: LabClinicasTheme.orangeColor,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Últimos chamados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: others
                  .map((p) => PasswordTile(
                        desknumber: p.password,
                        password: p.attendantDesk.toString(),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
