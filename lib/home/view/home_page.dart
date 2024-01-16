import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/extension/extensions.dart';
import 'package:pokedex/home/bloc/home_bloc.dart';
import 'package:pokedex/home/widgets/widgets.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            HomeBloc(pokemonRepository: context.read<PokemonRepository>())
              ..add(FetchPokemonList()),
        child: const HomeView(),
      );
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomeBloc>().add(FetchPokemonList());
      }
    });
  }

  Widget _buildListItem(BuildContext context, int index,
      {required bool isLoading,
      required List<PokemonResultResponse> listData}) {
    if (index < listData.length) {
      final id = listData[index].url.idFromPokeUrl();
      return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          context.pushNamed('detail', pathParameters: {"id": id});
        },
        child: ListItem(
          name: listData[index].name.capitalize(),
          id: id,
        ),
      );
    } else {
      return !isLoading
          ? const SizedBox.shrink()
          : Center(
              child: Platform.isIOS
                  ? const CupertinoActivityIndicator()
                  : const CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pokédex",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Builder(builder: (context) {
          final pokemonList =
              context.select((HomeBloc bloc) => bloc.state.pokemonList);
          final isLoading =
              context.select((HomeBloc bloc) => bloc.state.isLoading);
          return ListView.separated(
            controller: _scrollController,
            itemBuilder: (context, index) => _buildListItem(context, index,
                listData: pokemonList, isLoading: isLoading),
            itemCount: pokemonList.length + 1,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: index < pokemonList.length ? 8 : 0,
            ),
          );
        }));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
