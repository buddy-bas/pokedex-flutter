import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/details/models/models.dart';

void main() {
  group('DetailModel', () {
    group('PokemonDetail', () {
      test('supports value comparisons', () {
        const detail1 = PokemonDetail(
            stats: [],
            weight: '',
            height: '',
            name: '',
            types: [],
            evolutionChain: [],
            primaryColor: Colors.black,
            flavorText: '',
            abilities: []);
        const detail2 = PokemonDetail(
            stats: [],
            weight: '',
            height: '',
            name: '',
            types: [],
            evolutionChain: [],
            primaryColor: Colors.red,
            flavorText: '',
            abilities: []);
        expect(detail1, isNot(equals(detail2)));
      });
    });
    group('Species', () {
      test('supports value comparisons', () {
        expect(const Species(name: '', id: '0'),
            isNot(equals(const Species(name: '', id: '1'))));
      });
    });

    group('Chain', () {
      test('supports value comparisons', () {
        expect(const Chain(name: 'name', id: '', evolveTo: []),
            isNot(equals(const Chain(name: '', id: '', evolveTo: []))));
      });
    });

    group('Ability', () {
      test('supports value comparisons', () {
        expect(const Ability(name: 'name'),
            isNot(equals(const Ability(name: ''))));
      });
    });

    group('ElementType', () {
      test('supports value comparisons', () {
        const element1 = ElementType(name: '', color: Colors.black);
        const element2 = ElementType(name: '', color: Colors.red);
        expect(element1, isNot(equals(element2)));
      });
    });

    group('Stat', () {
      test('supports value comparisons', () {
        const stat1 = Stat(label: '', value: 1.0);
        const stat2 = Stat(label: '', value: 2.0);
        expect(stat1, isNot(equals(stat2)));
      });
    });
  });
}
