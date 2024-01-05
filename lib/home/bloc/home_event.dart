part of 'home_bloc.dart';

@immutable
final class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FetchPokemonList extends HomeEvent {
  FetchPokemonList({this.url});
  final String? url;
}
