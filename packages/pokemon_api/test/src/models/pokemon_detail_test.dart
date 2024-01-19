import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_api/pokemon_api.dart';

void main() {
  group('PokemonDetailResponse', () {
    test('can be (de)serialized', () {
      const pokemonDetailResponse = PokemonDetailResponse(
          weight: 1,
          height: 1,
          name: "name",
          types: [
            ElementType(type: ElementTypeDetail(name: "name", url: "url"))
          ],
          species: Species(url: "url", name: "name"),
          abilities: [
            Ability(ability: AbilityDetail(name: "name", url: "url"))
          ],
          stats: [Stat(baseStat: 20, stat: StatDetail(name: "name"))]);
      expect(PokemonDetailResponse.fromJson(pokemonDetailResponse.toJson()),
          equals(pokemonDetailResponse));
    });
  });
}
