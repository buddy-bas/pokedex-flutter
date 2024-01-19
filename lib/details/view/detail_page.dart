import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/static_data.dart';
import 'package:pokedex/details/bloc/detail_bloc.dart';
import 'package:pokedex/details/widgets/widgets.dart';
import 'package:pokemon_repository/pokemon_repository.dart';
import 'package:pokedex/extension/extensions.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.id,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailBloc(pokemonRepository: context.read<PokemonRepository>())
            ..add(FetchPokemonDetail(id: id)),
      child: DetailView(
        id: id,
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({
    super.key,
    required this.id,
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state.isLoading || state.detail.name.isEmpty) {
            return const Text("Loading");
          }
          return DecoratedBox(
              decoration: BoxDecoration(color: state.detail.primaryColor),
              child: Stack(
                children: [
                  CustomScrollView(slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Column(
                          children: [
                            const SizedBox(height: 100),
                            const SizedBox(
                              height: 144,
                            ),
                            Stack(
                              children: [
                                const DetailSection(),
                                Transform.translate(
                                  offset: const Offset(0, -144),
                                  child: Center(
                                    child: Image.network(
                                      StaticData.pokemonImageUrl(id),
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                  ]),
                  Header(
                      title: state.detail.name.toCapitalize(),
                      trailing: Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Text(
                          "#$id",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )),
                ],
              ));
        },
      ),
    );
  }
}
