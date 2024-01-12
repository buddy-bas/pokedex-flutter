import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/static_data.dart';
import 'package:pokedex/details/bloc/detail_bloc.dart';
import 'package:pokedex/details/models/models.dart';
import 'package:pokedex/details/widgets/widgets.dart';
import 'package:pokedex/extension/extensions.dart';
import 'package:pokedex/icons/custom_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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

  List<Widget> _evolutionGrid(EvolutionChain chain, Color primaryColor) {
    return chain
        .map((e) => Flexible(
                child: Row(
              children: [
                Flexible(
                  child: StaggeredGrid.count(
                    crossAxisCount: e.length <= 2 ? 1 : 2,
                    crossAxisSpacing: 5,
                    children: e
                        .map((e) => StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: Image.network(
                                  StaticData.pokemonImageUrl(e.id)),
                            ))
                        .toList(),
                  ),
                ),
                (chain.indexOf(e) < chain.length - 1)
                    ? Icon(
                        CustomIcons.arrow_right,
                        size: 30,
                        color: primaryColor,
                      )
                    : const SizedBox()
              ],
            )))
        .toList();
  }

  Widget _evolutionSection(PokemonDetail detail) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "Evolution",
            style: TextStyle(
              color: detail.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _evolutionGrid(detail.evolutionChain, detail.primaryColor),
        )
      ],
    );
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
                  iconData: CustomIcons.weight_hanging,
                  iconColor: detail.primaryColor,
                ),
                PhysicCharacterCard(
                    label: "Height",
                    value: detail.height,
                    iconData: CustomIcons.ruler_vertical,
                    iconColor: detail.primaryColor),
                PhysicCharacterCard(
                    label: "Move",
                    value: detail.abilities[0].name.capitalize(),
                    iconData: CustomIcons.hotjar,
                    iconColor: detail.primaryColor)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      detail.flavorText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Base Stat",
                style: TextStyle(
                  color: detail.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Column(children: _statList(detail.stats, detail.primaryColor)),
            detail.evolutionChain.length > 1
                ? _evolutionSection(detail)
                : const SizedBox(
                    height: 200,
                  )
          ],
        ),
      ),
    );
  }
}
