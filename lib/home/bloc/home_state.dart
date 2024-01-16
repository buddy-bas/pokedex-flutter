part of 'home_bloc.dart';

@immutable
final class HomeState extends Equatable {
  const HomeState(
      {this.pokemonList = const [],
      this.isLoading = false,
      this.hasReachedMax = false});

  final List<PokemonResultResponse> pokemonList;
  final bool isLoading;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [pokemonList, isLoading, hasReachedMax];

  @override
  String toString() {
    return '''HomeState { pokemonList: $pokemonList, isLoading: $isLoading, hasReachedMax: $hasReachedMax} ''';
  }

  HomeState copyWith(
      {List<PokemonResultResponse>? pokemonList,
      bool? isLoading,
      bool? hasReachedMax}) {
    return HomeState(
      pokemonList: pokemonList ?? this.pokemonList,
      isLoading: isLoading ?? this.isLoading,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
