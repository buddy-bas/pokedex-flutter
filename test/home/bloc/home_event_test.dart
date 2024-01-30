// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/home/bloc/home_bloc.dart';

void main() {
  group('HomeEvent', () {
    group('FetchPokemonList', () {
      test('supports value comparisons', () {
        expect(FetchPokemonList(), FetchPokemonList());
      });
    });
  });
}
