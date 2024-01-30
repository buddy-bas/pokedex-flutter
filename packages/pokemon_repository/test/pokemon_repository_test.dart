import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/src/pokemon.dart';
import 'package:mocktail/mocktail.dart';

class MockPokemonApiClient extends Mock implements PokemonApiClient {}

void main() {
  group('PokemonRepository', () {
    late PokemonApiClient pokemonApiClient;
    late PokemonRepository pokemonRepository;

    setUp(() {
      pokemonApiClient = MockPokemonApiClient();
      pokemonRepository = PokemonRepository(
        pokemonApiClient: pokemonApiClient,
      );
    });

    group('constructor', () {
      test('instantiates internal Pokemon api client when not injected', () {
        expect(PokemonRepository(), isNotNull);
      });
    });

    test('calls pokemonList', () async {
      try {
        await pokemonRepository.getPokemonList();
      } catch (_) {}
      verify(() => pokemonApiClient.pokemonList()).called(1);
    });

    test('calls pokemonSpecies', () async {
      const name = "Pikachu";
      try {
        await pokemonRepository.getPokemonSpecies(name: name);
      } catch (_) {}
      verify(() => pokemonApiClient.pokemonSpecies(name: name)).called(1);
    });

    test('calls pokemonDetail', () async {
      const id = "1";
      try {
        await pokemonRepository.getPokemonDetail(id: id);
      } catch (_) {}
      verify(() => pokemonApiClient.pokemonDetail(id: id)).called(1);
    });

    test('calls pokemonEvolution', () async {
      const id = "1";
      try {
        await pokemonRepository.getPokemonEvolution(id: id);
      } catch (_) {}
      verify(() => pokemonApiClient.pokemonEvolution(id: id)).called(1);
    });
  });
}
