part of 'detail_bloc.dart';

@immutable
final class DetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchPokemonDetail extends DetailEvent {
  FetchPokemonDetail({required this.id});
  final String id;
}
