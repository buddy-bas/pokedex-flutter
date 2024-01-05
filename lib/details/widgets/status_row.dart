import 'package:flutter/material.dart';

import 'animate_progress_bar.dart';

class StatusRow extends StatelessWidget {
  const StatusRow(
      {super.key,
      required this.label,
      required this.value,
      required this.color});

  final String label;
  final double value;
  final Color color;

  String _convertValueToLabel() {
    final label = value.toInt().toString();
    if (value < 10) {
      return '00$label';
    } else if (value < 100) {
      return '0$label';
    } else {
      return label;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          _convertValueToLabel(),
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        AnimateProgressBar(
          value: value,
          maxValue: 255,
          accentColor: color,
        ),
      ],
    );
  }
}
