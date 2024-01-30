import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pokedex/home/bloc/home_bloc.dart';
import 'package:pokedex/home/home.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:pokedex/routes/app_router.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class MockHomeBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class MockPokemonRepository extends Mock implements PokemonRepository {}

class MockAppRouter extends Mock implements AppRouter {}

void main() {
  group('HomePage', () {
    late PokemonRepository pokemonRepository;

    setUp(() {
      pokemonRepository = MockPokemonRepository();
    });
    testWidgets('renders HomeView', (tester) async {
      when(pokemonRepository.getPokemonList)
          .thenAnswer((_) async => const PokemonListResponse(
              count: 1,
              results: [
                PokemonResultResponse(
                    name: 'bulbasaur',
                    url: 'https://pokeapi.co/api/v2/pokemon/1/'),
              ],
              next: ''));
      await tester.pumpWidget(RepositoryProvider.value(
          value: pokemonRepository,
          child: const MaterialApp(home: HomePage())));
      expect(find.byType(HomeView), findsOneWidget);
    });
  });

  group('HomeView', () {
    late HomeBloc homeBloc;

    setUp(() {
      homeBloc = MockHomeBloc();
    });

    testWidgets('render UI correctly', (tester) async {
      when(() => homeBloc.state).thenReturn(const HomeState(pokemonList: [
        PokemonResultResponse(
            name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      ], isLoading: true));

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: homeBloc,
                child: const HomeView(),
              ),
            ),
          ),
        );
      });

      expect(find.byType(CircularProgressIndicator), isNotNull);
      when(() => homeBloc.state).thenReturn(const HomeState(pokemonList: [
        PokemonResultResponse(
            name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/'),
      ], isLoading: false));
      expect(find.text('Bulbasaur'), findsOneWidget);
    });
  });
}
