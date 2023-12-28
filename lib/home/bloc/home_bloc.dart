import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_repository/pokemon_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository,
        super(const HomeState()) {
    on<FetchPokemonList>(_fetchPokemonList);
    on<FetchPokemonDetail>(_fetchPokemonDetail);
  }

  final PokemonRepository _pokemonRepository;
  String? nextUrl;

  Future<void> _fetchPokemonList(
    FetchPokemonList event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;
    emit(state.copyWith(isLoading: true));
    try {
      final data = await _pokemonRepository.getPokemonList(url: nextUrl);
      emit(state.copyWith(
          pokemonList: List.of(state.pokemonList)..addAll(data.results)));
      if (data.next!.isEmpty) emit(state.copyWith(hasReachedMax: true));
      nextUrl = data.next;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _fetchPokemonDetail(
    FetchPokemonDetail event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;
    emit(state.copyWith(isLoading: true));
    try {
      final data = await _pokemonRepository.getPokemonList(url: nextUrl);

      emit(state.copyWith(
          pokemonList: List.of(state.pokemonList)..addAll(data.results)));
      if (data.next!.isEmpty) emit(state.copyWith(hasReachedMax: true));
      nextUrl = data.next;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
