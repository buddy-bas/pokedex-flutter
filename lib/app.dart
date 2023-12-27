import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/home/home.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class App extends StatelessWidget {
  const App({super.key, required pokemonRepository})
      : _pokemonRepository = pokemonRepository;

  final PokemonRepository _pokemonRepository;

  @override
  Widget build(BuildContext context) => RepositoryProvider.value(
      value: _pokemonRepository,
      child: const MaterialApp(
        home: HomePage(),
      ));
}
