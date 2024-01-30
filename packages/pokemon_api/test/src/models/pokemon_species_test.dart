import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_api/pokemon_api.dart';

void main() {
  group('PokemonSpeciesResponse', () {
    test('can be (de)serialized', () {
      const pokemonSpeciesResponse = PokemonSpeciesResponse(
          flavorTextEntries: [FlavorText(flavorText: "flavorText")],
          evolutionChain: EvolutionChain(url: "url"));
      expect(PokemonSpeciesResponse.fromJson(pokemonSpeciesResponse.toJson()),
          equals(pokemonSpeciesResponse));
    });
  });
}
