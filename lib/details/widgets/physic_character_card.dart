import 'package:flutter/material.dart';

class PhysicCharacterCard extends StatelessWidget {
  const PhysicCharacterCard(
      {super.key,
      required this.value,
      required this.label,
      required this.iconData,
      required this.iconColor});
  final String value;
  final String label;
  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 18,
                color: iconColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF666666)),
          ),
        ],
      ),
    );
  }
}
