import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/app_bloc_observer.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  final pokemonApiClient = PokemonApiClient();
  final pokemonRepository =
      PokemonRepository(pokemonApiClient: pokemonApiClient);
  runApp(App(
    pokemonRepository: pokemonRepository,
  ));
}
