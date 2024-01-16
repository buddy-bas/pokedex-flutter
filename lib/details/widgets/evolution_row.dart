import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokedex/data/static_data.dart';
import 'package:pokedex/details/models/models.dart';
import 'package:pokedex/icons/custom_icons.dart';

class EvolutionRow extends StatelessWidget {
  const EvolutionRow({super.key});

  @override
  Widget build(BuildContext context) {
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

    return const Placeholder();
  }
}
