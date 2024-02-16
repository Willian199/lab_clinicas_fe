import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DocumentsBoxWidget extends StatelessWidget {
  const DocumentsBoxWidget({
    super.key,
    required this.upload,
    required this.icon,
    required this.label,
    required this.totalFiles,
    this.onTap,
  });

  final bool upload;
  final Widget icon;
  final String label;
  final int totalFiles;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final totalFileLabel = totalFiles > 0 ? '($totalFiles)' : '';
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: upload ? LabClinicasTheme.lightOrangeColor : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: LabClinicasTheme.orangeColor),
          ),
          child: Column(
            children: [
              Expanded(child: icon),
              Text(
                '$label $totalFileLabel',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: LabClinicasTheme.orangeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
