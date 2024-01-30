import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_api/pokemon_api.dart';

void main() {
  group('PokemonEvolutionChainResponse', () {
    test('can be (de)serialized', () {
      const pokemonEvolutionChainResponse = PokemonEvolutionChainResponse(
          chain:
              Chain(species: Species(name: "name", url: "url"), evolvesTo: []));
      expect(
          PokemonEvolutionChainResponse.fromJson(
              pokemonEvolutionChainResponse.toJson()),
          equals(pokemonEvolutionChainResponse));
    });
  });
}
