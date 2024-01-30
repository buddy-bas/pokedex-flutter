import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/home/bloc/home_bloc.dart';
import 'package:pokedex/home/home.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

class MockHttpClient extends Mock implements Dio {}

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

void main() {
  group('App', () {
    late PokemonRepository pokemonRepository;

    setUp(() {
      pokemonRepository = MockPokemonRepository();
    });
    testWidgets('is a App', (tester) async {
      expect(App(pokemonRepository: pokemonRepository), isA<App>());
    });

    testWidgets('renders HomePage', (tester) async {
      when(pokemonRepository.getPokemonList)
          .thenAnswer((_) async => const PokemonListResponse(
              count: 1,
              results: [
                PokemonResultResponse(
                    name: 'bulbasaur',
                    url: 'https://pokeapi.co/api/v2/pokemon/1/'),
              ],
              next: ''));
      await tester.pumpWidget(App(pokemonRepository: pokemonRepository));

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets("press on Pokemon list item", (tester) async {
      //#region mock response data
      const mockPokemonDetailResponse = PokemonDetailResponse(
          weight: 1,
          name: "bulbasaur",
          height: 1,
          types: [
            ElementType(
                type: ElementTypeDetail(
                    name: 'grass', url: 'https://pokeapi.co/api/v2/type/12/'))
          ],
          species: Species(
              url: 'https://pokeapi.co/api/v2/pokemon-species/bulbasaur',
              name: 'bulbasaur'),
          abilities: [
            Ability(
                ability: AbilityDetail(
                    name: 'chlorophyll',
                    url: 'https://pokeapi.co/api/v2/ability/34/'))
          ],
          stats: [
            Stat(baseStat: 1, stat: StatDetail(name: 'attack')),
            Stat(baseStat: 1, stat: StatDetail(name: 'defense')),
            Stat(baseStat: 1, stat: StatDetail(name: 'special-attack')),
            Stat(baseStat: 1, stat: StatDetail(name: 'special-defense')),
            Stat(baseStat: 1, stat: StatDetail(name: 'speed')),
            Stat(baseStat: 1, stat: StatDetail(name: 'hp'))
          ]);
      const mockPokemonSpeciesResponse = PokemonSpeciesResponse(
          flavorTextEntries: [FlavorText(flavorText: '')],
          evolutionChain: EvolutionChain(
              url: 'https://pokeapi.co/api/v2/evolution-chain/1/'));
      const mockPokemonEvolutionChainResponse = PokemonEvolutionChainResponse(
          chain: Chain(
              species: Species(
                  url: 'https://pokeapi.co/api/v2/pokemon-species/bulbasaur',
                  name: 'bulbasaur'),
              evolvesTo: [
            Chain(
                species: Species(
                    url: 'https://pokeapi.co/api/v2/pokemon-species/bulbasaur',
                    name: 'bulbasaur'),
                evolvesTo: [])
          ]));
      //#end region

      when(pokemonRepository.getPokemonList)
          .thenAnswer((_) async => const PokemonListResponse(
              count: 1,
              results: [
                PokemonResultResponse(
                    name: 'bulbasaur',
                    url: 'https://pokeapi.co/api/v2/pokemon/1/'),
              ],
              next: ''));
      await tester.pumpWidget(App(pokemonRepository: pokemonRepository));

      expect(find.byType(HomePage), findsOneWidget);

      expect(find.text("Pokédex"), findsOneWidget);
      await mockNetworkImagesFor(() async {
        await tester.pump();
      });
      // expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text("Bulbasaur"), findsOneWidget);
      final pressableListWidget = find.byKey(const Key('pressableListKey0'));
      await tester.tap(pressableListWidget);

      when(() => pokemonRepository.getPokemonDetail(id: '1'))
          .thenAnswer((_) async => mockPokemonDetailResponse);
      when(() => pokemonRepository.getPokemonSpecies(name: 'bulbasaur'))
          .thenAnswer((_) async => mockPokemonSpeciesResponse);
      when(() => pokemonRepository.getPokemonEvolution(id: '1'))
          .thenAnswer((_) async => mockPokemonEvolutionChainResponse);
      await tester.pumpAndSettle();
      expect(find.text('Bulbasaur'), findsWidgets);
    });
  });
}
