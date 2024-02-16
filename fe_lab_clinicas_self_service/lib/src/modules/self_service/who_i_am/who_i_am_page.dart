import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final formKey = GlobalKey<FormState>();

  final nameEC = TextEditingController();

  final sobrenomeEC = TextEditingController();

  final selfServiceController = Injector.get<SelfServiceController>();

  @override
  void dispose() {
    nameEC.dispose();
    sobrenomeEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        nameEC.text = '';
        sobrenomeEC.text = '';

        selfServiceController.clearForm();
      },
      child: Scaffold(
        appBar: LabClinicasAppbar(
          actions: [
            PopupMenuButton(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Finalizar Terminal'),
                  )
                ];
              },
              onSelected: (value) async {
                if (value == 1) {
                  final nav = Navigator.of(context);
                  await SharedPreferences.getInstance().then((sp) => sp.clear());
                  nav.pushNamedAndRemoveUntil('/', (route) => false);
                }
              },
            )
          ],
        ),
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
                          const Text(
                            'Bem-Vindo',
                            style: LabClinicasTheme.titleStyle,
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                          TextFormField(
                            controller: nameEC,
                            validator: Validatorless.required('Nome obrigatório'),
                            decoration: const InputDecoration(
                              label: Text('Digite o seu nome'),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: sobrenomeEC,
                            onEditingComplete: () {
                              final valid = formKey.currentState?.validate() ?? false;
                              if (valid) {
                                selfServiceController.setWhoIAmDataStepAndNext(nameEC.text, sobrenomeEC.text);
                              }
                            },
                            validator: Validatorless.required('Sobrenome obrigatório'),
                            decoration: const InputDecoration(
                              label: Text('Digite o seu sobrenome'),
                            ),
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
                                  selfServiceController.setWhoIAmDataStepAndNext(nameEC.text, sobrenomeEC.text);
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
      ),
    );
  }
}
