import 'package:flutter/material.dart';

import 'animate_progress_bar.dart';

class StatusRow extends StatelessWidget {
  const StatusRow({super.key, required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          child: Text(
            label,
            style: const TextStyle(
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
          value.toString(),
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        AnimateProgressBar(value: value, maxValue: 255),
      ],
    );
  }
}
