import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokedex/data/static_data.dart';
import 'package:pokedex/details/models/models.dart';
import 'package:pokedex/extension/extensions.dart';
import 'package:pokedex/icons/custom_icons.dart';

class EvolutionRow extends StatelessWidget {
  const EvolutionRow(
      {super.key, required this.chain, required this.primaryColor});

  final EvolutionChain chain;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: chain
          .expand((e) => [
                Flexible(
                  child: StaggeredGrid.count(
                    crossAxisCount: e.length <= 2 ? 1 : 2,
                    children: e
                        .map((e) => StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: Column(children: [
                                Expanded(
                                  child: Image.network(
                                    StaticData.pokemonImageUrl(e.id),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  e.name.capitalize(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ]),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    CustomIcons.arrow_right,
                    size: 30,
                    color: primaryColor,
                  ),
                )
              ])
          .take(chain.length * 2 - 1)
          .toList(),
    );
  }
}
