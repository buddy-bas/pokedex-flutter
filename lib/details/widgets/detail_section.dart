import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/details/bloc/detail_bloc.dart';
import 'package:pokedex/details/models/models.dart';
import 'package:pokedex/details/widgets/widgets.dart';
import 'package:pokedex/extension/extensions.dart';

class DetailSection extends StatelessWidget {
  const DetailSection({super.key});

  List<Widget> _statList(List<Stat> list, Color labelColor) => list
      .map((e) => StatusRow(
            label: e.label,
            value: e.value,
            color: labelColor,
          ))
      .toList();
  List<Widget> _elementList(List<ElementType> list) {
    return list.asMap().entries.map((e) {
      int index = e.key;
      ElementType value = e.value;
      if (list.length > 1) {
        if (index < list.length - 1) {
          return Container(
              margin: const EdgeInsets.only(right: 16),
              child: ElementTag(
                  name: value.name.capitalize(), color: value.color));
        }
      }
      return ElementTag(name: value.name.capitalize(), color: value.color);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final detail = context.select((DetailBloc bloc) => bloc.state.detail);

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
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _elementList(detail.types)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "About",
                style: TextStyle(
                  color: detail.primaryColor,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PhysicCharacterCard(
                  label: "Weight",
                  value: detail.weight,
                ),
                PhysicCharacterCard(
                  label: "Height",
                  value: detail.height,
                ),
                PhysicCharacterCard(
                  label: "Move",
                  value: detail.abilities[0].name.capitalize(),
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
              child: Text(
                "Base Stat",
                style: TextStyle(
                  color: detail.primaryColor,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Column(children: _statList(detail.stats, detail.primaryColor)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Evolution",
                style: TextStyle(
                  color: detail.primaryColor,
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
