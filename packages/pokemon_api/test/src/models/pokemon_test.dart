import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_api/src/models/pokemon.dart';

void main() {
  group('PokemonListResponse', () {
    test('can be (de)serialized', () {
      const pokemonListResponse = PokemonListResponse(
          count: 1,
          next: "",
          previous: "",
          results: [PokemonResultResponse(name: "name", url: "url")]);
      expect(PokemonListResponse.fromJson(pokemonListResponse.toJson()),
          equals(pokemonListResponse));
    });
  });
}
