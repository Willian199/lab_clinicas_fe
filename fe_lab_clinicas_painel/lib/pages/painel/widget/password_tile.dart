import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class PasswordTile extends StatelessWidget {
  const PasswordTile({
    required this.password,
    required this.desknumber,
    super.key,
  });

  final String password;
  final String desknumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: LabClinicasTheme.orangeColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            password,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.blueColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Guichê $desknumber',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
