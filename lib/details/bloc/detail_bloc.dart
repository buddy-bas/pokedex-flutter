import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/data/static_data.dart';
import 'package:pokedex/details/models/models.dart';
import 'package:pokedex/extension/extensions.dart';
import 'package:pokemon_api/pokemon_api.dart' as pokemon_api;
import 'package:pokemon_repository/pokemon_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

typedef CheckCallback = void Function(List<Species> species);

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

  void _combineEvolution(
      List<pokemon_api.Chain> evolvesTo, CheckCallback onResult) {
    List<Species> speciesGroup = [];
    for (var element in evolvesTo) {
      final species = Species(
          name: element.species.name, id: element.species.url.idFromPokeUrl());
      speciesGroup.add(species);

      if (element.evolvesTo.isNotEmpty) {
        _combineEvolution(element.evolvesTo, onResult);
      }
    }
    onResult(speciesGroup);
  }

  EvolutionChain _getEvolutionChain(
      pokemon_api.PokemonEvolutionChainResponse chainRes) {
    EvolutionChain chain = [];
    _combineEvolution(chainRes.chain.evolvesTo, (species) {
      chain.add(species);
    });
    chain.add([
      Species(
          name: chainRes.chain.species.name,
          id: chainRes.chain.species.url.idFromPokeUrl())
    ]);
    return chain;
  }

  PokemonDetail _convertApiToBlocModel(
      pokemon_api.PokemonDetailResponse detailRes,
      pokemon_api.PokemonSpeciesResponse speciesRes,
      pokemon_api.PokemonEvolutionChainResponse chainRes) {
    EvolutionChain chain = _getEvolutionChain(chainRes);

    return PokemonDetail(
        primaryColor: StaticData
            .elementColors[detailRes.types[0].type.url.idFromPokeUrl()]!,
        types: detailRes.types
            .map((e) => ElementType(
                name: e.type.name,
                color: StaticData.elementColors[e.type.url.idFromPokeUrl()]!))
            .toList(),
        stats: detailRes.stats
            .map((e) => Stat(
                label: _covertStatusName(e.stat.name),
                value: e.baseStat.toDouble()))
            .toList(),
        name: detailRes.name,
        weight: detailRes.weight.toString(),
        height: detailRes.height.toString(),
        evolutionChain: chain.reversed.toList(),
        flavorText:
            speciesRes.flavorTextEntries[0].flavorText.replaceAll("\n", " "),
        abilities: detailRes.abilities
            .map((e) => Ability(name: e.ability.name))
            .toList());
  }

  Future<void> _fetchPokemonDetail(
    FetchPokemonDetail event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final detailRes = await _pokemonRepository.getPokemonDetail(id: event.id);
      final speciesRes =
          await _pokemonRepository.getPokemonSpecies(name: detailRes.name);
      final evolvesRes = await _pokemonRepository.getPokemonEvolution(
          id: speciesRes.evolutionChain.url.idFromPokeUrl());
      emit(state.copyWith(
          detail: _convertApiToBlocModel(detailRes, speciesRes, evolvesRes)));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
