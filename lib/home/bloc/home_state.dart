part of 'home_bloc.dart';

@immutable
final class HomeState extends Equatable {
  const HomeState(
      {this.pokemonList = const [],
      this.nextPageUrl = '',
      this.isLoading = false});

  final List<PokemonResponseResult> pokemonList;
  final String nextPageUrl;
  final bool isLoading;

  @override
  List<Object?> get props => [pokemonList, isLoading, nextPageUrl];

  @override
  String toString() {
    return '''HomeState { pokemonList: $pokemonList, nextPageUrl: $nextPageUrl, isLoading: $isLoading} ''';
  }

  HomeState copyWith(
      {List<PokemonResponseResult>? pokemonList,
      String? nextPageUrl,
      bool? isLoading}) {
    return HomeState(
        pokemonList: pokemonList ?? this.pokemonList,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        isLoading: isLoading ?? this.isLoading);
  }
}
