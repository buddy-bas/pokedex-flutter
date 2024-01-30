import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/static_data.dart';

void main() {
  test('StaticData elementColors contain expected colors', () {
    expect(StaticData.elementColors['1'], equals(const Color(0xFFAAA67F)));
    expect(StaticData.elementColors['2'], equals(const Color(0xFFC12239)));
    expect(StaticData.elementColors['3'], equals(const Color(0xFFA891EC)));
    expect(StaticData.elementColors['4'], equals(const Color(0xFFA43E9E)));
    expect(StaticData.elementColors['5'], equals(const Color(0xFFDEC16B)));
    expect(StaticData.elementColors['6'], equals(const Color(0xFFB69E31)));
    expect(StaticData.elementColors['7'], equals(const Color(0xFFA7B723)));
    expect(StaticData.elementColors['8'], equals(const Color(0xFF70559B)));
    expect(StaticData.elementColors['9'], equals(const Color(0xFFB7B9D0)));
    expect(StaticData.elementColors['10'], equals(const Color(0xFFF57D31)));
    expect(StaticData.elementColors['11'], equals(const Color(0xFF6493EB)));
    expect(StaticData.elementColors['12'], equals(const Color(0xFF74CB48)));
    expect(StaticData.elementColors['13'], equals(const Color(0xFFF9CF30)));
    expect(StaticData.elementColors['14'], equals(const Color(0xFFFB5584)));
    expect(StaticData.elementColors['15'], equals(const Color(0xFF9AD6DF)));
    expect(StaticData.elementColors['16'], equals(const Color(0xFF6F35FC)));
    expect(StaticData.elementColors['17'], equals(const Color(0xFF75574C)));
    expect(StaticData.elementColors['18'], equals(const Color(0xFFE69EAC)));
  });
  test('StaticData pokemonImageUrl return expected url', () {
    const id = '123';
    expect(
        StaticData.pokemonImageUrl(id),
        equals(
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png"));
  });
}
