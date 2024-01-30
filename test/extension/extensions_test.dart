import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/extension/extensions.dart';

void main() {
  group('CapitalizeExtensions', () {
    test('toCapitalize return expected value', () {
      const expected = 'Test';
      const value = 'test';
      expect(value.toCapitalize(), equals(expected));
    });
  });

  group('GetIdFormUrlExtension', () {
    test('idFromPokeUrl return expected value', () {
      const expected = '1';
      const value = "https://pokeapi.co/api/v2/pokemon/1/";
      expect(value.toIdFromPokeUrl(), equals(expected));
    });
  });
}
