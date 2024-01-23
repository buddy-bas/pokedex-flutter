import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/home/home.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

class MockHttpClient extends Mock implements Dio {}

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
  });
}
