import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/static_data.dart';
import 'package:pokedex/details/models/models.dart';
import 'package:pokedex/extension/extensions.dart';
import 'package:pokemon_api/pokemon_api.dart' hide Ability, Stat, ElementType;
import 'package:pokemon_repository/pokemon_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository,
        super(const DetailState()) {
    on<FetchPokemonDetail>(_fetchPokemonDetail);
  }

  final PokemonRepository _pokemonRepository;

  String _covertStatusName(String name) {
    switch (name) {
      case 'hp':
        return "HP";
      case 'attack':
        return "ATK";
      case 'defense':
        return "DEF";
      case 'special-attack':
        return "SATK";
      case 'special-defense':
        return "SDEF";
      case 'speed':
        return "SPD";
      default:
        return "";
    }
  }

  PokemonDetail _convertApiToBlocModel(PokemonDetailResponse res) {
    return PokemonDetail(
        primaryColor:
            StaticData.elementColors[res.types[0].type.url.idFromPokeUrl()]!,
        types: res.types
            .map((e) => ElementType(
                name: e.type.name,
                color: StaticData.elementColors[e.type.url.idFromPokeUrl()]!))
            .toList(),
        stats: res.stats
            .map((e) => Stat(
                label: _covertStatusName(e.stat.name),
                value: e.baseStat.toDouble()))
            .toList(),
        name: res.name,
        weight: res.weight.toString(),
        height: res.height.toString(),
        abilities:
            res.abilities.map((e) => Ability(name: e.ability.name)).toList());
  }

  Future<void> _fetchPokemonDetail(
    FetchPokemonDetail event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final data = await _pokemonRepository.getPokemonDetail(id: event.id);
      emit(state.copyWith(detail: _convertApiToBlocModel(data)));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
