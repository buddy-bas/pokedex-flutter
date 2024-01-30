// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/details/bloc/detail_bloc.dart';

void main() {
  group('DetailEvent', () {
    group('FetchPokemonDetail', () {
      test('supports value comparisons', () {
        expect(FetchPokemonDetail(id: '1'), FetchPokemonDetail(id: '1'));
      });
    });
  });
}
