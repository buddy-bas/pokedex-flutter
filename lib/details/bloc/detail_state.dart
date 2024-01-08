part of 'detail_bloc.dart';

@immutable
final class DetailState extends Equatable {
  const DetailState({
    this.isLoading = false,
    this.detail = const PokemonDetail(
        primaryColor: Colors.white,
        stats: [],
        weight: '',
        height: '',
        name: '',
        types: [],
        flavorText: '',
        abilities: []),
  });

  final bool isLoading;
  final PokemonDetail detail;

  @override
  List<Object?> get props => [detail, isLoading];

  @override
  String toString() {
    return '''DetailState { pokemonDetail: $detail, isLoading: $isLoading } ''';
  }

  DetailState copyWith({
    PokemonDetail? detail,
    bool? isLoading,
  }) {
    return DetailState(
      detail: detail ?? this.detail,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
