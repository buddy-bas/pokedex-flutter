import 'package:flutter/material.dart';
import 'package:pokedex/details/widgets/widgets.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 56,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElementTag(),
                SizedBox(
                  width: 16,
                ),
                ElementTag()
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                "About",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PhysicCharacterCard(
                  label: "Height",
                  value: "2,7 kg",
                ),
                PhysicCharacterCard(
                  label: "Height",
                  value: "2,7 kg",
                ),
                PhysicCharacterCard(
                  label: "Height",
                  value: "2,7 kg",
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "This is a pokemon",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                "Base Stat",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Column(
              children: List.generate(
                  6, (index) => const StatusRow(label: "SATK", value: 69)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                "Evolution",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
