import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pokemon.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class PokemonListResponse extends Equatable {
  const PokemonListResponse({
    required this.count,
    required this.results,
    required this.next,
    this.previous,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);

  final int count;
  final List<PokemonResultResponse> results;
  final String next;
  final String? previous;

  @override
  List<Object?> get props => [count, results, next, previous];
}

@JsonSerializable()
class PokemonResultResponse extends Equatable {
  const PokemonResultResponse({required this.name, required this.url});

  factory PokemonResultResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResultResponseToJson(this);

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}
