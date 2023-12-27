import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/bloc/home_bloc.dart';
import 'package:pokedex/home/widgets/widgets.dart';
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
    _scrollController.addListener(_onScroll);
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
            itemBuilder: (context, index) {
              if (index < pokemonList.length) {
                return ListItem(name: pokemonList[index].name, id: "213");
              } else {
                return !isLoading
                    ? const SizedBox.shrink()
                    : Center(
                        child: Platform.isIOS
                            ? const CupertinoActivityIndicator()
                            : const CircularProgressIndicator());
              }
            },
            itemCount: pokemonList.length + 1,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: index < pokemonList.length ? 8 : 0,
            ),
          );
        }));
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<HomeBloc>().add(FetchPokemonList());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
